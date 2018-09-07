go-gde:Golang-Docker-Environment


#### 编译

```
$ CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o demo main.go
```

#### 交叉编译

##### Mac 下编译 Linux 和 Windows 64位可执行程序

```
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build main.go
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build main.go
```

##### Linux 下编译 Mac 和 Windows 64位可执行程序

```
CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build main.go
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build main.go
```

##### Windows 下编译 Mac 和 Linux 64位可执行程序

```
SET CGO_ENABLED=0
SET GOOS=darwin
SET GOARCH=amd64
go build main.go

SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build main.go
```

GOOS：目标平台的操作系统（darwin、freebsd、linux、windows） 
GOARCH：目标平台的体系架构（386、amd64、arm） 
交叉编译不支持 CGO 所以要禁用它

* [Golang 在 Mac、Linux、Windows 下如何交叉编译 - CSDN博客](https://blog.csdn.net/panshiqu/article/details/53788067)

****

#### app

```
└── app
    ├── conf
    │   └── supervisor_web.ini  # supervisor配置文件
    ├── logs                    # 执行日志目录
    │   └── .gitignore
    └── web
        ├── demo                # 编译后的golang二进制文件
        └── main.go
```

****

`supervisor_web.ini` sample:

```
[program:web]
directory=/app/web/
command=/app/web/demo
user=root
autostart=true
autorestart=true
startsecs=10
startretries=3
stdout_logfile=/app/logs/web_out.log
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=10
stdout_capture_maxbytes=1MB
stderr_logfile=/app/logs/web_err.log
stderr_logfile_maxbytes=1MB
stderr_logfile_backups=10
stderr_capture_maxbytes=1MB
```

***

