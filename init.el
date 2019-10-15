;; 使用清华大学镜像源
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) 

;; 设置鼠标样式为竖杠,cursor-type为buffer-local变量
(setq-default cursor-type 'bar)

;; Emacs启动的时候不显示欢迎页面
(setq inhibit-splash-screen -1)

;; 启动Emacs最大化
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; 所有buffer都打开行号显示
(global-linum-mode 1)

;; 打开显示列模式
(column-number-mode 1)

;; 高亮显示当前行
;;(hl-line-highlight 1)
(global-hl-line-mode 1)

;; 输入内容替换选中的region
(delete-selection-mode 1)

;; 关闭滚动栏
(scroll-bar-mode -1)

;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭菜单栏
;;(menu-bar-mode -1)

;; 关闭创建～结尾的备份文件
(setq make-backup-files nil)

;; 关闭创建#autosave#文件
(setq auto-save-default nil)

;; 关闭创建.#lock文件链接
(setq create-lockfiles nil)

;; 设置字体
;;(set-frame-font "Monaco:Regular")
(set-frame-font "Monaco:pixelsize=14:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")
;;(set-face-attribute 'default nil :height 140)

;;打开括号自动配对显示
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 记录最近打开文件
(recentf-mode 1)

;; 绑定F6快速打开最近打开文件
(global-set-key (kbd "<f6>") 'recentf-open-files)

;; 所有buffer都打开company-mode补全
(setq use-package-always-ensure t)
(use-package company
  :config
  (global-company-mode 1))

;; 开启ivy模式
(ivy-mode 1)

;; 使用monokai主题,依赖monokai主题
;;(load-theme 'monokai t)

;; 使用complete-anaconda作为anaconda-mode的backend
;;(require 'rx)
;;(eval-after-load "company"
;;  '(add-to-list 'company-backends 'company-anaconda))

;; 使用anaconda-mode
;;(add-hook 'python-mode-hook 'anaconda-mode)
;;(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; 使用elpy作为python补全
(exec-path-from-shell-initialize)
(require 'use-package)
(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; 使用google翻译
;; C-c t 将当前光标的英文单词翻译为中文
;; C-c r 将当前光标的中文翻译为英文
;; C-c T 自己输入英文进行翻译
;; C-c R 自己输入中文进行翻译
(require 'google-translate)
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)
(global-set-key (kbd "C-c r") 'google--at-point-reverse)
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
(setq my/themelist '(monokai solarized-dark adwaita dichromacy leuven tsdh-light whiteboard zenburn spacemacs-dark spacemacs-light))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" default)))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (groovy-mode exec-path-from-shell elpy company-anaconda anaconda-mode spacemacs-theme anti-zenburn-theme zenburn-theme zencoding-mode magit counsel swiper solarized-theme monokai-theme molokai-theme ivy google-translate company)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(send-mail-function (quote smtpmail-send-it))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
