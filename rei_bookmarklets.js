// Forever FE_DEV
javascript:;(function(){
    function setCookie (ky, val, dys, pth, dom, scr) {
        var exp='',day=86400;
        if (!ky||/^(?:expires|max\-age|path|domain|secure)$/i.test(ky)){return!1;}
        exp=!dys?'':(dys===Infinity?'; expires=Fri, 31 Dec 9999 23:59:59 GMT':'; max-age='+dys * day);
        document.cookie=encodeURIComponent(ky)+'='+encodeURIComponent(val)+exp+(dom?'; domain='+dom:'')+(pth?'; path='+pth:'')+(scr?'; secure':'');
        return!0;
    }
    setCookie('fe_dev','1',Infinity,'/');
    // Forever FE_NO_REV
    // setCookie('fe_no_rev','1',Infinity,'/');
}());

// Unset FE_{all}
javascript:;(function(){
    function unsetCookie (ky, pth, dom) {
      if (!hasCookie(ky)){return!1;}
      return document.cookie=encodeURIComponent(ky)+'=; expires=Thu, 01 Jan 1970 00:00:00 GMT'+(dom?'; domain='+dom:'')+(pth?';path='+pth:''),!0;
    }
    function hasCookie (ky) {
      if (!ky) { return!1; }
      return (new RegExp('(?:^|;\\s*)' + encodeURIComponent(ky).replace(/[\-\.\+\*]/g, '\\$&') + '\\s*\\=')).test(document.cookie);
    }
    unsetCookie('fe_dev','/');
    // unsetCookie('fe_no_rev','/');
}());
