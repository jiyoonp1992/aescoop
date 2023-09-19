package study.spring.aesoop.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import study.spring.aesoop.helper.UploadItem;
import study.spring.aesoop.helper.WebHelper;

@Controller
public class UploadController {
    // -> import study.spring.springhelper.helper.WebHelper;
    @Autowired
    WebHelper webHelper;

    /** 업로드 폼을 구성하는 페이지 */
    @RequestMapping(value = "/upload/upload.do", method = RequestMethod.GET)
    public String upload() {
        return "upload/upload";
    }

    /** 업로드 폼에 대한 action 페이지 */
    @RequestMapping(value = "/upload/upload_ok.do", method = RequestMethod.POST)
    public ModelAndView uploadOk(Model model, 
            @RequestParam(required=false) String subject, 
            @RequestParam(required=false) MultipartFile photo) {

        /** 1) 업로드 파일 저장하기 */
        // 업로드 된 파일이 존재하는지 확인한다.
        if (photo.getOriginalFilename().isEmpty()) {
            return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
        }

        // 업로드 된 파일이 저장될 경로 정보를 생성한다.
        File targetFile = new File(webHelper.getUploadDir(), photo.getOriginalFilename());
        
        // 업로드 된 파일을 지정된 경로로 복사한다.
        try {
            photo.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
            return webHelper.redirect(null, "업로드 된 파일 저장에 실패했습니다.");
        }
        
        /** 2) 업로드 경로 정보 처리하기 */
        // 복사된 파일의 절대경로를 추출한다.
        // --> 운영체제 호환을 위해 역슬래시를 슬래시로 변환한다.
        String absPath = targetFile.getAbsolutePath().replace("\\", "/");
        
        // 절대경로에서 이미 root-context에 지정되어 있는 업로드 폴더 경로를 삭제한다.
        String filePath = absPath.replace(webHelper.getUploadDir(), "");

        /** 3) 업로드 결과를 Beans에 저장 */
        UploadItem item = new UploadItem();
        item.setContentType(photo.getContentType());
        item.setFieldName(photo.getName());
        item.setFileSize(photo.getSize());
        item.setOrginName(photo.getOriginalFilename());
        item.setFilePath(filePath);
        
        // 업로드 경로와 썸네일 경로는 웹 상에서 접근 가능한 경로 문자열로 변환하여 Beans에 추가한다.        
        String fileUrl = webHelper.getUploadUrl(filePath);
        item.setFileUrl(fileUrl);

        /** 4) View 처리 */
        // 텍스트 정보를 View로 전달한다.
        model.addAttribute("subject", subject);
        // 업로드 정보를 View로 전달한다.
        model.addAttribute("item", item);

        // 뷰 호출 --> 메서드 리턴 타입이 "ModelAndView"인 경우 View의 호출이 ModelAndView 객체가 된다.
        return new ModelAndView("upload/upload_ok");
    }
    
    /** WebHelper를 활용하는 업로드 처리를 위한 <form>을 구성하는 페이지 */
    @RequestMapping(value = "/upload/use_helper.do", method = RequestMethod.GET)
    public String useHelper() {
        return "upload/use_helper";
    }

    /** WebHelper를 활용하는 업로드 처리에 대한 action 페이지 */
    @RequestMapping(value = "/upload/use_helper_ok.do", method = RequestMethod.POST)
    public ModelAndView useHelperOk(Model model, 
                                    @RequestParam(required=false) MultipartFile photo) {

        /** 1) 업로드 처리 */
        // 업로드 결과가 저장된 Beans를 리턴받는다.
        UploadItem item = null;
        try {
            item = webHelper.saveMultipartFile(photo);
        } catch (NullPointerException e) {
            e.printStackTrace();
            return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return webHelper.redirect(null, "업로드에 실패했습니다.");
        }

        /** [신규] 파일 형식이 이미지인 경우 썸네일 이미지 생성하기 */
        if (item != null && item.getContentType().indexOf("image") > -1) {
            // 필요한 이미지 사이즈로 썸네일을 생성할 수 있다.
            String thumbnailPath = null;
            
            try {
                thumbnailPath = webHelper.createThumbnail(item.getFilePath(), 240, 240, true);
            } catch (Exception e) {
                e.printStackTrace();
                return webHelper.redirect(null, "썸네일 이미지 생성에 실패했습니다.");
            }
            
            // 썸네일 경로를 URL로 변환
            String thumbnailUrl = webHelper.getUploadUrl(thumbnailPath);
            // 리턴할 객체에 썸네일 정보 추가
            item.setThumbnailPath(thumbnailPath);
            item.setThumbnailUrl(thumbnailUrl);
        }

        /** 2) View 처리 */
        model.addAttribute("item", item);
        return new ModelAndView("upload/use_helper_ok");
    }
    
    /** 다중 업로드 처리를 위한 <form>을 구성하는 페이지 */
    @RequestMapping(value = "/upload/multiple.do", method = RequestMethod.GET)
    public String multiple() {
        return "upload/multiple";
    }

    /** 다중 업로드 처리에 대한 action 페이지 */
    @RequestMapping(value = "/upload/multiple_ok.do", method = RequestMethod.POST)
    public ModelAndView multipleOk(Model model, @RequestParam(required=false) MultipartFile[] photo) {

        /** 1) 업로드 처리 */
        List<UploadItem> list = null;
        try {
            list = webHelper.saveMultipartFile(photo);
        } catch (NullPointerException e) {
            e.printStackTrace();
            return webHelper.redirect(null, "업로드 된 파일이 없습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return webHelper.redirect(null, "업로드에 실패했습니다.");
        }
        
        /** 2) 업로드 된 항목 수 만큼 반복을 수행하면서 원본 파일 경로와 썸네일 이미지의 경로를 설정한다. */
        for (int i=0; i<list.size(); i++) {
            UploadItem item = list.get(i);
            
            // 컨텐츠 형식에 "image"라는 단어가 포함된 경우에만 진행 
            if (item.getContentType().indexOf("image") > -1) {
                // 썸네일 이미지 생성
                String thumbnailPath = null;
            
                try {
                    thumbnailPath = webHelper.createThumbnail(item.getFilePath(), 240, 240, true);
                } catch (Exception e) {
                    e.printStackTrace();
                    return webHelper.redirect(null, "썸네일 생성에 실패했습니다.");
                }
                
                // 썸네일 경로를 웹상에 노출 가능한 형태로 보정
                String thumbnailUrl = webHelper.getUploadUrl(thumbnailPath);
                item.setThumbnailPath(thumbnailUrl);
            }
            
            // 원본 파일의 경로를 웹상에 노출 가능한 형태로 보정
            String fileUrl = webHelper.getUploadUrl(item.getFilePath());
            item.setFileUrl(fileUrl);
        }
        
        /** 3) View 처리 */
        // 업로드 정보를 View로 전달한다.
        model.addAttribute("list", list);

        // 뷰 호출 --> 메서드 리턴 타입이 "ModelAndView"인 경우 View의 호출이 ModelAndView 객체가 된다.
        return new ModelAndView("upload/multiple_ok");
    }
}
















