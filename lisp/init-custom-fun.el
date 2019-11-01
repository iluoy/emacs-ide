;; 安装emacs package函数
(defun my/install-package(package-name)
  (unless (package-installed-p package-name)
    (when (not package-archive-contents)
      (message "fresh emacs database....")
      (package-refresh-contents))
    (package-install package-name)
    (message "install %S success!" package-name)))

;; 快捷打开配置文件
(defun find-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 提供init-custome-fun feature
(provide 'init-custom-fun)
