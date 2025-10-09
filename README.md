# Portfolio

Flutter 기반 개인 포트폴리오 웹 애플리케이션입니다. 인터랙티브한 UI/UX와 애니메이션을 통해 다양한 프로젝트와 작업물을 소개합니다.

## 🎯 Features

- **반응형 디자인**: 모바일과 데스크톱 환경 모두 지원
- **인터랙티브 UI**: 호버 효과와 애니메이션으로 풍부한 사용자 경험 제공
- **다양한 프로젝트 쇼케이스**: 여러 프로젝트를 카테고리별로 구성

## 📁 Project Structure

```
lib/
├── core/                    # 핵심 로직 및 공통 모듈
│   ├── common/             # 공통 데이터 모델 및 리포지토리
│   └── loading_status.dart # 로딩 상태 관리
├── routes/                  # 라우팅 설정
│   ├── app_router.dart     # 앱 라우터 설정
│   └── routes.dart         # 라우트 정의
├── theme/                   # 테마 및 스타일
│   ├── app_colors.dart     # 컬러 팔레트
│   └── app_text_styles.dart # 텍스트 스타일
├── ui/                      # UI
│   ├── home/               # 홈 화면
│   ├── resume/             # 이력서/프로필
│   ├── works/              # 프로젝트 작업물
│   │   ├── bezier/         # Bezier 곡선 프로젝트
│   │   ├── gyeon/          # 경슐랭 프로젝트
│   │   ├── luckit/         # Luckit 프로젝트
│   │   ├── manitto/        # Manitto 프로젝트
│   │   └── search/         # 유사어 검색 프로젝트
│   └── common/             # 공통 UI 컴포넌트
└── main.dart                # 앱 진입점
```

## 🛠 Tech Stack

### Framework & Language
- **Flutter**
- **Dart**

### State Management & Architecture
- **flutter_riverpod (^2.6.1)**
- **equatable (^2.0.7)**

### Routing & Navigation
- **go_router (^16.0.0)**

### Animation & Graphics
- **flame (^1.30.1)**
- **flame_lottie (^0.4.2+14)**
- **lottie (^3.3.1)**
- **flutter_svg (^2.2.0)**

### Utilities
- **url_launcher (^6.3.2)**
- **smooth_page_indicator (^1.2.1)**
- **intl (^0.20.2)**

## 📱 Sections

### Home
메인 홈 화면으로, 프로젝트 아이콘들을 인터랙티브하게 표시합니다. 각 아이콘에 마우스를 올리면 프로젝트 설명이 애니메이션과 함께 나타납니다.

### Resume
개인 이력서 및 프로필 정보를 보여줍니다.

### Works

#### Bezier
Bezier 곡선을 활용한 디자인 구현 프로젝트

#### Gyeon
경슐랭 메뉴판 프로젝트 쇼케이스

#### Luckit
운세 기반 할일 추천 투두리스트 럿잇 쇼케이스

#### Search
유사도 검색 기능을 구현한 프로젝트

#### Manitto
마니또 관련 프로젝트 (제작중)


## 🎨 Design

### Fonts
- **Pretendard**
- **Carter One**
- **Tenada**

### Assets
- `assets/images/`: 이미지 리소스
- `assets/icons/`: 아이콘 리소스
- `assets/lotties/`: Lottie 애니메이션 파일


## 📄 License

Copyright © 2025 Jaehoon Ma

## 👤 Author & Contact

**Jaehoon Ma**

email: bluekmky@gmail.com

문의 및 협업 제안 환영합니다.

