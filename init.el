;; 使用清华大学镜像源
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) 

;; 设置鼠标样式为竖杠,cursor-type为buffer-local变量
(setq-default cursor-type 'bar)

;; Emacs启动的时候不显示欢迎页面
(setq inhibit-splash-screen -1)

;; 所有buffer都打开行号显示
(global-linum-mode 1)

;; 关闭滚动栏
(scroll-bar-mode -1)

;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭菜单栏
;;(menu-bar-mode -1)

;; 设置字体
(set-frame-font "Monaco-Regular-20")
;;(set-face-attribute 'default nil :height 150)

;; 所有buffer都打开company-mode补全
(global-company-mode 1)

;; 开启ivy模式
(ivy-mode 1)

;; 使用monokai主题,依赖monokai主题
;;(load-theme 'monokai t)

;; 使用google翻译
;; C-c t 将当前光标的英文单词翻译为中文
;; C-c r 将当前光标的中文翻译为英文
;; C-c T 自己输入英文进行翻译
;; C-c R 自己输入中文进行翻译
(require 'google-translate)
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)
(global-set-key (kbd "C-c r") 'google-translate-at-point-reverse)
(global-set-key (kbd "C-c R") 'google-translate-query-translate-reverse)
(setq-default google-translate-default-source-language "en")
(setq-default google-translate-default-target-language "zh-CN")
(eval-after-load 'google-translate-core
  '(setq google-translate-base-url "http://translate.google.cn/translate_a/single"
         google-translate-listen-url "http://translate.google.cn/translate_tts"))

(eval-after-load 'google-translate-tk
  '(setq google-translate--tkk-url "http://translate.google.cn/"))


;; ======================================================================= 自定义变量、函数、快捷键 START =======================================================

;; ============================================= 自定义变量 Start =========================================
;; 主题列表
(setq my/themelist '(monokai solarized-dark adwaita dichromacy leuven tsdh-light whiteboard))

;; ============================================= 自定义变量 END   =========================================



;; ============================================= 自定义函数 Start =========================================

;; 随机切换主题
(defun switchTheme()
  "The func use to switch theme"
   (interactive)
  (load-theme (nth (random (length my/themelist)) my/themelist) t)
  )

;; 快捷打开配置文件
(defun find-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; ============================================= 自定义函数 END   =========================================




;; ============================================= 自定义快捷键 Start =======================================

;; 绑定F1为切换主题快捷键
(global-set-key (kbd "<f1>") 'switchTheme)

;; 绑定F2位打开配置文件快捷键
(global-set-key (kbd "<f2>") 'find-init-file)

;; ============================================= 自定义快捷键 END   =======================================


;; ===================================================================== 自定义变量、函数、快捷键 END ===========================================================

