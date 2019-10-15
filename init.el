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
(set-frame-font "Monaco:pixelsize=14:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")

;;打开括号自动配对显示
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 记录最近打开文件
(recentf-mode 1)

;; 绑定F6快速打开最近打开文件
(global-set-key (kbd "<f6>") 'recentf-open-files)

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
  :init
  (ivy-mode 1))

;; 使用elpy作为python补全
(exec-path-from-shell-initialize)
(use-package elpy
  :ensure t
  :pin melpa
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
