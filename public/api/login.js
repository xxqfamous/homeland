/**
 * Created by maievshabu on 2017/2/9.
 */

/**
 * @api  {get} api/v3/auth/reg_mobile_code 发送手机验证码
 * @apiVersion 0.1.0
 * @apiname reg_mobile_code
 * @apiGroup Login
 * @apiParam {String} mobile 手机号码
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 *
 * @apiSampleRequest api/v3/auth/reg_mobile_code
 *
 * @apiError Mobile  手机号码格式错误／或者手机号码为空
 *
 */



/**
 * @api  {post} api/v3/auth/login_or_register 用户登录或注册
 * @apiVersion 0.1.0
 * @apiname login_or_register
 * @apiGroup Login
 * @apiParam {String} mobile 手机号码
 * @apiParam {String} vcode 手机验证码
 * @apiParam {String} client_id 授权认证码 c0d64bee
 * @apiParam {String} client_secret 授权认证码 e27e6afbc8197108ef9027a6ff90310d055743f4c9720b5160fccce74a1f78a4
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 * @apiSuccess {String}   access_token   授权认证
 * @apiSuccess {Object}   data      数据对象
 *
 * @apiSampleRequest api/v3/auth/login_or_register
 *
 * @apiError Mobile  用户名或密码不正确
 *
 */



/**
 * @api  {get} api/v3/users/me.json 当前用户信息
 * @apiVersion 0.1.0
 * @apiname me
 * @apiGroup Login
 * @apiParam {String} access_token 授权认证
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 *
 * @apiSampleRequest api/v3/users/me.json
 *
 * @apiError 401 授权认证失败
 *
 */



 /**
 * @api  {get} api/v3/advertisers.json 广告商列表
 * @apiVersion 0.1.0
 * @apiname advertisers
 * @apiGroup advertisers
 *
 * @apiSuccess {String}   count
 * @apiSuccess {String}   total_pages
 * @apiSuccess {String}   current_page
 * @apiSuccess {Object}   advertisers
 *
 * @apiSampleRequest api/v3/advertisers
 *
 *
 */

/**
 * @api  {get} api/v3/advertisers/:id.json 广告商详情
 * @apiVersion 0.1.0
 * @apiname advertiser/:id.json
 * @apiGroup advertisers
 *
 * @apiSuccess {Object}   advertiser
 *
 * @apiSampleRequest api/v3/advertisers/1.json
 *
 *
 */


/**
 * @api  {get} api/v3/banners.json 首页banner
 * @apiVersion 0.1.0
 * @apiname banners
 * @apiGroup banners
 *
 * @apiSuccess {String}   count
 * @apiSuccess {String}   total_pages
 * @apiSuccess {String}   current_page
 * @apiSuccess {Object}   banners
 *
 * @apiSampleRequest api/v3/banners.json
 *
 *
 */

/**
 * @api  {post} api/v3/cashout_applies.json 用户提现
 * @apiVersion 0.1.0
 * @apiname me
 * @apiGroup User
 * @apiParam {String} access_token 授权认证
 * @apiParam {String} cash_account 提现支付宝账号
 * @apiParam {String} cash_name 提现姓名
 * @apiParam {Number} amount 提现金额
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 *
 * @apiSampleRequest api/v3/cashout_applies.json
 *
 * @apiError Mobile  手机号码格式错误／或者手机号码为空
 *
 */



/**
 * @api  {post} api/v3/users/binding_alipay.json 用户绑定支付宝信息
 * @apiVersion 0.1.0
 * @apiname binding_alipay
 * @apiGroup User
 * @apiParam {String} access_token 授权认证
 * @apiParam {String} alipay_account 支付宝账号
 * @apiParam {String} alipay_name 支付宝姓名
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 *
 * @apiSampleRequest api/v3/users/binding_alipay.json
 *
 */

/**
 * @api  {get} api/v3/users/account_records.json 用户交易流水记录
 * @apiVersion 0.1.0
 * @apiname account_records
 * @apiGroup User
 * @apiParam {String} access_token 授权认证
 * @apiParam {Number} type 1-收入，2支出
 * @apiParam {Number} page 页
 * @apiParam {Number} per_page 页码大小
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 * @apiSuccess {String}   count
 * @apiSuccess {String}   total_pages
 * @apiSuccess {String}   current_page
 * @apiSuccess {Object}   account_records
 *
 * @apiSampleRequest api/v3/users/account_records.json
 *
 */



/**
 * @api  {get} api/v3/notifications.json 通知-获取用户的通知列表
 * @apiVersion 0.1.0
 * @apiname notifications
 * @apiGroup User
 * @apiParam {String} access_token 授权认证
 * @apiParam {Number} page 页
 * @apiParam {Number} per_page 页码大小
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 * @apiSuccess {String}   count
 * @apiSuccess {String}   total_pages
 * @apiSuccess {String}   current_page
 * @apiSuccess {Object}   notifications
 *
 * @apiSampleRequest api/v3/notifications.json
 *
 */


/**
 * @api  {post} api/v3/notifications/read.json 通知-设成已读状态
 * @apiVersion 0.1.0
 * @apiname read
 * @apiGroup User
 * @apiParam {String} access_token 授权认证
 * @apiParam {Array} ids[] 记录Id 例：ids[]=9
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 *
 * @apiSampleRequest api/v3/notifications/read.json
 *
 */

/**
 * @api  {DELETE} /api/v3/notifications/all 通知-删除当前用户的所有通知
 * @apiVersion 0.1.0
 * @apiname all
 * @apiGroup User
 * @apiParam {String} access_token 授权认证
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 *
 * @apiSampleRequest api/v3/notifications/all.json
 *
 */

/**
 * @api  {get} /api/v3/notifications/unread_count 通知-获得未读通知数量
 * @apiVersion 0.1.0
 * @apiname unread_count
 * @apiGroup User
 * @apiParam {String} access_token 授权认证
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 * @apiSuccess {Number}   count   消息数量
 *
 * @apiSampleRequest api/v3/notifications/unread_count.json
 *
 */


/**
 * @api  {DELETE} /api/v3/notifications/:id 通知-删除当前用户的某个通知
 * @apiVersion 0.1.0
 * @apiname delete
 * @apiGroup User
 * @apiParam {String} access_token 授权认证
 * @apiParam {String} id
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 *
 * @apiSampleRequest api/v3/notifications/8.json
 *
 */