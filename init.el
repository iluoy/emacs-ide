;; 判断是否为macos,目前只适配了macos
(if (not (string= system-type "darwin"))
    (error "only support macos")
    (message "yes,it's macos"))

;; 添加lisp目录到load-path变量
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; 加载与插件无关的Emacs自带的配置
(require 'init-base)

;; 安装use-package插件
(if (not (package-installed-p 'use-package))
    (package-install 'use-package)
  (message "use-package has been installed right!"))

;; 所有buffer都打开company-mode补全
(use-package company
  :ensure t
  :pin melpa
  :init
  (global-company-mode 1))

;; 开启ivy模式
(use-package ivy
  :ensure t
  :pin melpa
  :if
  (string= system-type "darwin")
  :init
  (ivy-mode 1))

;; 当使用Macos当时候path变量有问题
(use-package exec-path-from-shell
  :ensure t
  :pin melpa
  :init
  (exec-path-from-shell-initialize))

;; 使用elpy作为python补全
(use-package elpy
  :ensure t
  :pin melpa
  :init
  (elpy-enable))

;; 加载init-org feature
(require 'init-org)


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
 '(package-selected-packages
   (quote
    (chinese-word-at-point names popup zencoding-mode zenburn-theme spacemacs-theme solarized-theme quelpa-use-package pythonic monokai-theme molokai-theme magit groovy-mode google-translate exec-path-from-shell elpy counsel company-anaconda anti-zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
