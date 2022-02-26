package cc.mrbird.febs.documentation.controller;

import cc.mrbird.febs.common.entity.FebsConstant;
import cc.mrbird.febs.common.utils.FebsUtil;
import lombok.RequiredArgsConstructor;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author ISC
 * @version V1.0
 * @date 2020/12/21 16:35
 */
@Controller("documentationView")
@RequiredArgsConstructor
@RequestMapping(FebsConstant.VIEW_PREFIX + "ewp")
public class ViewController {

    @GetMapping("ewp")
    @RequiresPermissions("ewp:view")
    public String all(){
        return FebsUtil.view("ewp/viewForm");
    }
}
