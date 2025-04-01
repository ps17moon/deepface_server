# Python 기반 애플리케이션을 위한 베이스 이미지
FROM python:3.9-slim

# 작업 디렉토리 생성 및 설정
WORKDIR /app

# 시스템 패키지 업데이트 및 libGL 설치
RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 현재 디렉토리의 파일을 컨테이너로 복사
COPY . .

# Python 의존성 설치
RUN pip install --no-cache-dir -r requirements.txt

# 앱 실행 (원하는 실행 파일명으로 수정 가능)
CMD ["python", "app.py"]
