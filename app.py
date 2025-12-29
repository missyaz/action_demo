from flask import Flask
import os

app = Flask(__name__)

# 获取镜像标签（GitHub Action传入，用于验证发版结果）
IMAGE_TAG = os.getenv("IMAGE_TAG", "unknown")

@app.route('/')
def hello_k3s():
    return f"Hello K3s! 🚀<br>当前镜像版本：{IMAGE_TAG}<br>部署来源：GitHub Action"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)