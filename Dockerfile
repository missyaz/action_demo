# 基础镜像（国内访问快）
FROM python:3.9-alpine

# 工作目录
WORKDIR /app

# 复制项目文件
COPY . /app

# 安装依赖（阿里云镜像源加速）
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache gcc musl-dev && \
    pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install flask -i https://mirrors.aliyun.com/pypi/simple/

# 暴露端口（对应k3s部署文件）
EXPOSE 80

# 启动命令
CMD ["python", "app.py"]