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
            "field": "mobile",
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
            "description": "<p>授权认证码 c0d64bee</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "client_secret",
            "description": "<p>授权认证码 e27e6afbc8197108ef9027a6ff90310d055743f4c9720b5160fccce74a1f78a4</p>"
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
        "url": "http://106.14.213.161:3000/api/v3/auth/login_or_register"
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
        "url": "http://106.14.213.161:3000/api/v3/users/me.json"
      }
    ],
    "error": {
      "fields": {
        "Error 4xx": [
          {
            "group": "Error 4xx",
            "optional": false,
            "field": "401",
            "description": "<p>授权认证失败</p>"
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
        "url": "http://106.14.213.161:3000/api/v3/auth/reg_mobile_code"
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
    "url": "api/v3/users/account_records.json",
    "title": "用户交易流水记录",
    "version": "0.1.0",
    "name": "account_records",
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
            "type": "Number",
            "optional": false,
            "field": "type",
            "description": "<p>1-收入，2支出</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "page",
            "description": "<p>页</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "per_page",
            "description": "<p>页码大小</p>"
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
            "field": "account_records",
            "description": ""
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://106.14.213.161:3000/api/v3/users/account_records.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "User"
  },
  {
    "type": "DELETE",
    "url": "/api/v3/notifications/all",
    "title": "通知-删除当前用户的所有通知",
    "version": "0.1.0",
    "name": "all",
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
        "url": "http://106.14.213.161:3000/api/v3/notifications/all.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "User"
  },
  {
    "type": "post",
    "url": "api/v3/users/binding_alipay.json",
    "title": "用户绑定支付宝信息",
    "version": "0.1.0",
    "name": "binding_alipay",
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
            "field": "alipay_account",
            "description": "<p>支付宝账号</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "alipay_name",
            "description": "<p>支付宝姓名</p>"
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
        "url": "http://106.14.213.161:3000/api/v3/users/binding_alipay.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "User"
  },
  {
    "type": "DELETE",
    "url": "/api/v3/notifications/:id",
    "title": "通知-删除当前用户的某个通知",
    "version": "0.1.0",
    "name": "delete",
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
            "field": "id",
            "description": ""
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
        "url": "http://106.14.213.161:3000/api/v3/notifications/8.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "User"
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
        "url": "http://106.14.213.161:3000/api/v3/cashout_applies.json"
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
    "url": "api/v3/notifications.json",
    "title": "通知-获取用户的通知列表",
    "version": "0.1.0",
    "name": "notifications",
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
            "type": "Number",
            "optional": false,
            "field": "page",
            "description": "<p>页</p>"
          },
          {
            "group": "Parameter",
            "type": "Number",
            "optional": false,
            "field": "per_page",
            "description": "<p>页码大小</p>"
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
            "field": "notifications",
            "description": ""
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://106.14.213.161:3000/api/v3/notifications.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "User"
  },
  {
    "type": "post",
    "url": "api/v3/notifications/read.json",
    "title": "通知-设成已读状态",
    "version": "0.1.0",
    "name": "read",
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
            "type": "Array",
            "optional": false,
            "field": "ids[]",
            "description": "<p>记录Id 例：ids[]=9</p>"
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
        "url": "http://106.14.213.161:3000/api/v3/notifications/read.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "User"
  },
  {
    "type": "get",
    "url": "/api/v3/notifications/unread_count",
    "title": "通知-获得未读通知数量",
    "version": "0.1.0",
    "name": "unread_count",
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
            "type": "Number",
            "optional": false,
            "field": "count",
            "description": "<p>消息数量</p>"
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://106.14.213.161:3000/api/v3/notifications/unread_count.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "User"
  },
  {
    "type": "get",
    "url": "api/v3/advertisers/:id.json",
    "title": "广告商详情（作废）",
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
        "url": "http://106.14.213.161:3000/api/v3/advertisers/1.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "advertisers"
  },
  {
    "type": "get",
    "url": "api/v3/advertisers.json",
    "title": "广告商列表（作废）",
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
        "url": "http://106.14.213.161:3000/api/v3/advertisers"
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
        "url": "http://106.14.213.161:3000/api/v3/banners.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "banners"
  },
  {
    "type": "get",
    "url": "api/v3/partners.json",
    "title": "合作伙伴列表",
    "version": "0.1.0",
    "name": "partners",
    "group": "partners",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "hot",
            "description": "<p>热门推荐</p>"
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
            "field": "partners",
            "description": ""
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://106.14.213.161:3000/api/v3/partners"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "partners"
  },
  {
    "type": "get",
    "url": "api/v3/partners/:id.json",
    "title": "合作伙伴详情",
    "version": "0.1.0",
    "name": "partners__id_json",
    "group": "partners",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Object",
            "optional": false,
            "field": "partner",
            "description": ""
          }
        ]
      }
    },
    "sampleRequest": [
      {
        "url": "http://106.14.213.161:3000/api/v3/partners/1.json"
      }
    ],
    "filename": "./login.js",
    "groupTitle": "partners"
  }
] });
