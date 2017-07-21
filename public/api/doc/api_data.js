define({ "api": [
  {
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "optional": false,
            "field": "varname1",
            "description": "<p>No type.</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "varname2",
            "description": "<p>With type.</p>"
          }
        ]
      }
    },
    "type": "",
    "url": "",
    "version": "0.0.0",
    "filename": "./doc/main.js",
    "group": "E__workspace_git_homeland_public_api_doc_main_js",
    "groupTitle": "E__workspace_git_homeland_public_api_doc_main_js",
    "name": ""
  },
  {
    "type": "post",
    "url": "api/v3/auth/login_or_register",
    "title": "用户登录或注册",
    "version": "0.1.0",
    "name": "login_or_register",
    "group": "Login",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "username",
            "description": "<p>手机号码</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "vcode",
            "description": "<p>手机验证码</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "client_id",
            "description": "<p>授权认证码 6a508bf2</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "client_secret",
            "description": "<p>授权认证码 59cd57e9d4b11e49a9d5e5475f3952e3b39c547bbaed4424d980b271f22db70d</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>正确错误</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "mgs",
            "description": "<p>消息</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "access_token",
            "description": "<p>授权认证</p>"
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "data",
            "description": "<p>数据对象</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:3000/api/v3/auth/login_or_register"
      }
    ],
    "error": {
      "fields": {
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "Mobile",
            "description": "<p>用户名或密码不正确</p>"
          }
        ]
      }
    },
    "filename": "./login.js",
    "groupTitle": "Login"
  },
  {
    "type": "get",
    "url": "api/v3/users/me.json",
    "title": "当前用户信息",
    "version": "0.1.0",
    "name": "me",
    "group": "Login",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "access_token",
            "description": "<p>授权认证</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>正确错误</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "mgs",
            "description": "<p>消息</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:3000/api/v3/auth/random_code"
      }
    ],
    "error": {
      "fields": {
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "Mobile",
            "description": "<p>手机号码格式错误／或者手机号码为空</p>"
          }
        ]
      }
    },
    "filename": "./login.js",
    "groupTitle": "Login"
  },
  {
    "type": "get",
    "url": "api/v3/auth/reg_mobile_code",
    "title": "发送手机验证码",
    "version": "0.1.0",
    "name": "reg_mobile_code",
    "group": "Login",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "mobile",
            "description": "<p>手机号码</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>正确错误</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "mgs",
            "description": "<p>消息</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:3000/api/v3/auth/reg_mobile_code"
      }
    ],
    "error": {
      "fields": {
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "Mobile",
            "description": "<p>手机号码格式错误／或者手机号码为空</p>"
          }
        ]
      }
    },
    "filename": "./login.js",
    "groupTitle": "Login"
  },
  {
    "type": "post",
    "url": "api/v3/cashout_applies.json",
    "title": "用户提现",
    "version": "0.1.0",
    "name": "me",
    "group": "User",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "access_token",
            "description": "<p>授权认证</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "cash_account",
            "description": "<p>提现支付宝账号</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "cash_name",
            "description": "<p>提现姓名</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "amount",
            "description": "<p>提现金额</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "status",
            "description": "<p>正确错误</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "mgs",
            "description": "<p>消息</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:3000/api/v3/cashout_applies.json"
      }
    ],
    "error": {
      "fields": {
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "Mobile",
            "description": "<p>手机号码格式错误／或者手机号码为空</p>"
          }
        ]
      }
    },
    "filename": "./login.js",
    "groupTitle": "User"
  },
  {
    "type": "get",
    "url": "api/v3/advertisers/:id.json",
    "title": "广告商详情",
    "version": "0.1.0",
    "name": "advertiser__id_json",
    "group": "advertisers",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "advertiser",
            "description": ""
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:3000/api/v3/advertisers/1.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "advertisers"
  },
  {
    "type": "get",
    "url": "api/v3/advertisers.json",
    "title": "广告商列表",
    "version": "0.1.0",
    "name": "advertisers",
    "group": "advertisers",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "count",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "total_pages",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "current_page",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "advertisers",
            "description": ""
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:3000/api/v3/advertisers"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "advertisers"
  },
  {
    "type": "get",
    "url": "api/v3/banners.json",
    "title": "首页banner",
    "version": "0.1.0",
    "name": "banners",
    "group": "banners",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "count",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "total_pages",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "current_page",
            "description": ""
          },
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "banners",
            "description": ""
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://127.0.0.1:3000/api/v3/banners.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "banners"
  }
] });
