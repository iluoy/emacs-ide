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

;; 打开自动换行
(toggle-truncate-lines 1)

;; ORG中自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; 自动对齐表格
(add-hook 'org-mode-hook #'valign-mode)

;; 关闭创建～结尾的备份文件
(setq make-backup-files nil)

;; 关闭创建#autosave#文件
(setq auto-save-default nil)

;; 关闭创建.#lock文件链接
(setq create-lockfiles nil)

;; 在ORG模式下启动Emacs就能显示图像
;;(setq org-startup-with-inline-images t)

;; 设置字体
(set-frame-font "Monaco:pixelsize=14:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")

;;打开括号自动配对显示
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 记录最近打开文件
(recentf-mode 1)

;; 绑定F6快速打开最近打开文件
(global-set-key (kbd "<f6>") 'recentf-open-files)

;; 提供init-base feature
(provide 'init-base)
