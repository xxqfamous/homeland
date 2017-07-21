define({
  "name": "phb-serve",
  "version": "1.0.0",
  "description": "派红包服务",
  "title": "派红包服务",
  "url": "http://106.14.213.161:3000/",
  "sampleUrl": "http://106.14.213.161:3000/",
  "header": {
    "title": "概述",
    "content": "<ol>\n<li>phb-serve接口，采用json进行报文数据交互<br/></li>\n</ol>\n<ul>\n<li>200, 201 - 请求成功，或执行成功。</li>\n<li>400 - 参数不符合 API 的要求、或者数据格式验证没有通过，请配合 Response Body 里面的 error 信息确定问题。</li>\n<li>401 - 用户认证失败，或缺少认证信息，比如 access_token 过期，或没传，可以尝试用 refresh_token 方式获得新的 access_token。</li>\n<li>403 - 当前用户对资源没有操作权限。</li>\n<li>404 - 资源不存在。</li>\n<li>500 - 服务器异常。</li>\n</ul>\n<ol start=\"3\">\n<li>http请求包含的头信息: Content-Type: application/json; charset=UTF-8 ,不带头部：请求带.json后缀\n<br/></li>\n<li>对于服务接口，正常响应信息格式为：\n<br/></li>\n</ol>\n<pre>\n{\n  status: true,\n  msg: \n}\n</pre>\n<br/>\n异常响应信息格式为:\n<br/>\n<pre>\n{\n  status : false,\n  msg: \"错误消息\"\n}\n</pre>\n5. 接口认证：<br/>\n需要鉴权的接口都必须带有参数:access_token"
  },
  "footer": {
    "title": "代号定义",
    "content": "<h3>证件类型</h3>\n<p>身份证: IDCARD <br/></p>\n"
  },
  "order": [
    "OAuth2",
    "getAccessToken",
    "Vehicle_Insurance",
    "findModels",
    "getPlan",
    "quote",
    "check",
    "applyPayment",
    "Common_Insurance",
    "insure"
  ],
  "template": {
    "forceLanguage": "zh_cn",
    "withCompare": true,
    "withGenerator": true
  },
  "apidoc": "0.2.0",
  "generator": {
    "name": "apidoc",
    "time": "2017-07-21T08:29:29.464Z",
    "url": "http://apidocjs.com",
    "version": "0.16.1"
  }
});
