Pod::Spec.new do |s|

  s.name         = "ECBaseTableView"
  s.version      = "1.0.0"
  s.summary      = "快速创建tableview"
  s.homepage     = "https://github.com/sophistWY/ECBaseTableView"
  s.license      = "Copyright (c) 2017年 sophistWY. All rights reserved."
  s.author       = { "sophistWY" => "sophistwy@163.com" }
  s.platform   = :ios, "8.0"
  s.source       = { :git => "https://github.com/sophistWY/ECBaseTableView.git", :tag => s.version }
  s.source_files  = "ECBaseTableView", "ECBaseTableView/ECBaseTableView/Category/*.{h,m}"
  s.requires_arc = true

end
