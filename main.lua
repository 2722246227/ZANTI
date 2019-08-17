require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "com.androlua.*"
import "java.io.File"--文件操作
import"http"--网络
import "layout"--布局
import "shell"--shell命令
--activity.setTheme(android.R.style.Theme_Material_Light)
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)
activity.setContentView(loadlayout(layout))
--状态栏什么的
--exec("rm -r /data/data/com.zimperium.zanti/files/www/sharelisting.html")
--删除文件
--http.download("http://p4xzn4h3l.bkt.clouddn.com/sharelisting.zip","/storage/emulated/0/sharelisting.html")
--下载文件
--exec("chmod 777 /data/data/com.zimperium.zanti/files/www/sharelisting.html")
--修改权限
--下载anti.zip
--ZipUtil.unzip("/storage/emulated/0/anti.zip","/storage/emulated/0/")
--解压文件
if Build.VERSION.SDK_INT>=21 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff616161);
end
--设置ActionBar背景颜色
import "android.graphics.drawable.ColorDrawable"
activity.ActionBar.setBackgroundDrawable(ColorDrawable(0xff616161))
--自定义ActionBar标题颜色
import "android.text.SpannableString"
import "android.text.style.ForegroundColorSpan"
import "android.text.Spannable"
sp = SpannableString("ZantiRS扩展安装")
sp.setSpan(ForegroundColorSpan(0xffffffff),0,#sp,Spannable.SPAN_EXCLUSIVE_INCLUSIVE)
activity.ActionBar.setTitle(sp)

import "android.content.Intent"--弹出QQ
import "android.net.Uri"--弹出QQ
function onCreateOptionsMenu(menu)
  menu.add("反馈")
  menu.add("关于与帮助")
end
function onOptionsItemSelected(item)
  if item.Title=="反馈" then
    url="mqqwpa://im/chat?chat_type=wpa&uin=1119101855"
    activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
   elseif item.Title=="关于与帮助" then

    activity.newActivity("about")

  end
end
--命令
function exec(cmd)
  local p=io.popen(string.format('%s',cmd))
  local s=p:read("*a")
  p:close()
  return s
end

--进度条
function showProcessBar(text)
  jindu = ProgressDialog
  .show(activity, nil, text)
  jindu.setCancelable(true)
end
--下载进度条
import "android.content.*"
import "android.net.*"
function inapk(path)
  intent = Intent(Intent.ACTION_VIEW);
  intent.setDataAndType(Uri.parse("file:///"..path), "application/vnd.android.package-archive")
  intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
  activity.startActivity(intent);
end
import "java.net.URL"
function down(url,path)
  local tt=Ticker()
  tt.start()
  Http.download(url,path,function(code,data,cookie,header)
    tt.stop()
    jdv.Width=activity.Width
    ok.Text="100%"
    print("下载完成")
  end)
  function tt.onTick()
    local f=io.open(path,"r")
    if f~=nil then
      local len=f:read("a")
      local s=#len/lens
      local w=activity.Width*s
      jdv.Width=w
      ok.Text=math.ceil(s*100).."%"
    end
  end
end
function big(url,path)
  realUrl = URL(url)
  -- 打开和URL之间的连接
  con = realUrl.openConnection();
  -- 设置通用的请求属性
  con.setRequestProperty("accept", "*/*");
  con.setRequestProperty("connection", "Keep-Alive");
  con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
  lens=con.getContentLength()
  jd.Text="0%"
  down(url,path)
end

function GetFileSize(path)
  import "java.io.File"
  import "android.text.format.Formatter"
  size=File(tostring(path)).length()
  Sizes=Formatter.formatFileSize(activity, size)
  return Sizes
end
function getroot.onClick()--获取root权限
  if os.execute("su") then
  end
end
--下载文件内容
function ok.onClick()
  local wl=activity.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE).getActiveNetworkInfo();
  if wl== nil then
    print("无法连接到服务器")
   else
    local url="http://p4xzn4h3l.bkt.clouddn.com/anti.zip?attname="
    local path="/storage/emulated/0/anti.zip"
    exec("rm -r /data/data/com.esharo.Gun/files/")
    --shell命令的方法
    os.execute("rm -r /data/data/com.esharo.Gun/files/")
    http.download("http://p4xzn4h3l.bkt.clouddn.com/sharelisting.zip","/data/data/com.zimperium.zanti/files/sharelisting.html")
    exec("chmod 777 /data/data/com.zimperium.zanti/files/sharelisting.html")
    big(url,path)
    
    
  end
end


--解压文件
function decompression.onClick()
  showProcessBar[[安装中......
--请耐心等待通知
安装过程请勿乱动，如若出现未响应的情况，点击等待或者不用管即可]]
  t=Ticker()
  t.Period=2000
  t.start()
  t.onTick=function()
    t.stop()
    ZipUtil.unzip("/storage/emulated/0/anti.zip","/storage/emulated/0/")
    exec("rm -r /storage/emulated/0/anti.zip")
    jindu.hide()
    print("文件安装成功")
  end
end


import "android.net.Uri"
import "android.content.Intent"
包名="com.installexpand.zanti"
uri = Uri.parse("package:"..包名)
intent = Intent(Intent.ACTION_DELETE,uri)

function xz.onClick()
  activity.startActivity(intent)
end


hh.setVisibility(View.GONE)
hh.loadUrl("http://g6.jwf.365huoche.cn/ssss/detail/1705278/78301#138492")--加载网页