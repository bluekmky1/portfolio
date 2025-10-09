import '../../../../routes/routes.dart';
import '../assets.dart';
import 'mock_model.dart';

class MockData {
  static List<AppIconModel> appIcons = <AppIconModel>[
    AppIconModel(
      id: '0',
      title: 'Make It Real',
      explain: '상상을 현실로 만드는 개발자\n마재훈의 포트폴리오 웹사이트입니다.\n궁금한 아이콘을 클릭해보세요.',
      image: '',
      route: Routes.home.name,
    ),
    AppIconModel(
      id: '1',
      title: '유사어 검색 기능',
      explain:
          'Levenshtein Distance 알고리즘을 이용한\n약 2400종의 꽃 품종/품목에 대한\n유사어 검색 기능',
      image: Assets.appIcon3,
      route: Routes.search.name,
    ),
    AppIconModel(
      id: '2',
      title: 'Bézier curve',
      explain: '베지어 곡선을 사용한 디자인 구현',
      image: Assets.appIcon1,
      route: Routes.bezier.name,
    ),
    AppIconModel(
      id: '3',
      title: 'Luckit',
      explain: '오늘의 운세 기반 할 일 추천 투두 리스트\n(Feat. 구름톤 UNIV 3기)',
      image: Assets.appIcon2,
      route: Routes.luckit.name,
    ),
    AppIconModel(
      id: '4',
      title: '경슐랭 메뉴판',
      explain: 'Flutter와 Supabase를 사용하여\n하루만에 만든 학식당 메뉴판 웹사이트',
      image: Assets.appIcon5,
      route: Routes.gyeon.name,
    ),
    // AppIconModel(
    //   id: '5',
    //   title: '경기대 SGB 연수\n마니또 웹사이트',
    //   explain: '싱가폴 연수에서 동료들과 사용한\n말투 변환 익명 메시징 웹사이트',
    //   image: Assets.appIcon4,
    //   route: Routes.manitto.name,
    // ),
  ];

  static const List<Map<String, dynamic>> resumeSections =
      <Map<String, dynamic>>[
    <String, dynamic>{
      'title': '프로필',
      'modelList': MockData.profileModels,
    },
    <String, dynamic>{
      'title': '학력사항',
      'modelList': MockData.educationModels,
    },
    <String, dynamic>{
      'title': '경력사항',
      'modelList': MockData.jobModels,
    },
    <String, dynamic>{
      'title': '어학',
      'modelList': MockData.languageModels,
    },
    <String, dynamic>{
      'title': '교육/연수',
      'modelList': MockData.studyModels,
    },
    <String, dynamic>{
      'title': '기타활동',
      'modelList': MockData.ectActivityModels,
    },
    <String, dynamic>{'title': '수상내용', 'modelList': MockData.awardModels},
    <String, dynamic>{
      'title': '면허증',
      'modelList': MockData.certificateModels,
    },
    <String, dynamic>{
      'title': '병역',
      'modelList': MockData.militaryModels,
    },
  ];

  static const List<String> resumeTitles = <String>[
    '프로필',
    '학력사항',
    '경력사항',
    '어학',
    '교육/연수',
    '기타활동',
    '수상내용',
    '면허증',
    '병역',
  ];

  static const List<ResumeTileModel> awardModels = <ResumeTileModel>[
    ResumeTileModel(
      title: '2025. 02\n',
      value: '딥다이브 풀스택 과정 11회차 파이널 프로젝트 우수팀',
      subValue: '구름 딥다이브 / AI 생성 CS 문제 제공 웹사이트 개발 / 기획 + 프론트엔드로 참여',
    ),
    ResumeTileModel(
      title: '2024. 01\n',
      value: '데이터 애널리틱스 경진대회 최우수상 (공동 1등)',
      subValue: '경기대학교 경영학과 / 여기어때의 리뷰 크롤링 데이터 분석 및 화면 내 지표 개선방안 제안',
    ),
    ResumeTileModel(
      title: '2023. 12\n',
      value: 'SW 상상기업 최우수상',
      subValue: '경기대학교 / 꽃집과 소비자간 꽃 구매 플랫폼 개발 / 앱 개발(Flutter)로 참여',
    ),
    ResumeTileModel(
      title: '2023. 02\n',
      value: 'AI SW 창업 아이디어 캠프 대상',
      subValue: '경기대학교 / 버스에서 내릴 때 깨워주는 앱 제안',
    ),
  ];

  static const List<ResumeTileModel> ectActivityModels = <ResumeTileModel>[
    ResumeTileModel(
      title: '2024.07\n~ 2024.08 ',
      value: '구름톤 UNIV 3기 ',
      subValue: '',
    ),
    ResumeTileModel(
      title: '2020.01\n~ 2020.12 ',
      value: '멋쟁이 사자처럼 8기 ',
      subValue: '경기대학교 대표 선생님 활동',
    ),
    ResumeTileModel(
      title: '2019.04\n~ 2019.12 ',
      value: '멋쟁이 사자처럼 7기',
      subValue: '',
    ),
  ];

  static const List<ResumeTileModel> educationModels = <ResumeTileModel>[
    ResumeTileModel(
      title: '2019.03\n~ 2026.02',
      value: '경기대학교(수원캠퍼스) 경영학과',
      subValue: '최종학력 : 대학교(4년) 졸업 예정',
    ),
  ];

  static const List<ResumeTileModel> jobModels = <ResumeTileModel>[
    ResumeTileModel(
      title: '2023. 07\n~ 2024. 07 ',
      value: '㈜에잇블룸 ',
      subValue: '모바일 앱 및 관리자 웹페이지 개발',
    ),
  ];

  static const List<ResumeTileModel> languageModels = <ResumeTileModel>[
    ResumeTileModel(
      title: '2025.06\n',
      value: 'OPIc 영어 IM1 취득',
      subValue: 'ACTFL 주관',
    ),
  ];

  static const List<ResumeTileModel> profileModels = <ResumeTileModel>[
    ResumeTileModel(title: '이름', value: '마재훈'),
    ResumeTileModel(title: '생년월일', value: '2000.05.23'),
    ResumeTileModel(title: '연락처', value: '010-9639-3439'),
    ResumeTileModel(title: '이메일', value: 'bluekmky@gmail.com'),
    ResumeTileModel(title: '주소', value: '경기도 안양시 동안구 비산로 22'),
  ];

  static const List<ResumeTileModel> studyModels = <ResumeTileModel>[
    ResumeTileModel(
      title: '2025.08\n',
      value: '경기대학교 SGB 프로그램',
      subValue: '싱가포르 연수 참가',
    ),
    ResumeTileModel(
      title: '2024.08\n~ 2025.02 ',
      value: '[구름 x 인프런] 자바 스프링 & 리액트 풀스택 개발자 성장 과정 (11회차) ',
      subValue: '구름 KDT 딥다이브',
    ),
  ];

  static const List<ResumeTileModel> certificateModels = <ResumeTileModel>[
    ResumeTileModel(
      title: '2024.05.\n',
      value: '운전면허증',
      subValue: '2종 보통',
    ),
  ];

  static const List<ResumeTileModel> militaryModels = <ResumeTileModel>[
    ResumeTileModel(
      title: '2021. 06\n~ 2022. 12 ',
      value: '육군 병장 만기전역',
      subValue: '22사단 GP 소초병',
    ),
  ];

  static const List<Map<String, dynamic>> bezierTitleContents =
      <Map<String, dynamic>>[
    <String, dynamic>{
      'title': '작업 형태',
      'explain': '개인 디자인 구현 연습',
    },
    <String, dynamic>{
      'title': '작업 기간',
      'explain': '2024.02.10 ~ 2024.02.12',
    },
  ];

  static const List<SearchExplainModel> searchExplainModels =
      <SearchExplainModel>[
    SearchExplainModel(
      title: 'Overview',
      explain:
          '''레벤슈티인 거리 계산 알고리즘을 이용하여 간단한 한글 유사어 검색 기능을 설명하기 위해 제작한 프로젝트입니다. 텍스트 필드에 꽃 이름을 검색하면 유사한 꽃 이름만 남게 됩니다.''',
    ),
    SearchExplainModel(
      title: '배경',
      explain:
          '''화훼 경매 정보 앱 제작 도중, 약 2,400여 종의 꽃 품종을 검색할 수 있는 기능을 개발해야 하는 요구사항이 있었습니다. 당시 백엔드 개발자분의 의견으로, 엘라스틱 서치를 사용하기에는 리소스 낭비가 클 것으로 판단되어, 프론트엔드에서 간단한 검색 기능을 구현하기로 결정했습니다.''',
    ),
    SearchExplainModel(
      title: '문제',
      explain:
          '''검색 기능 구현 중, "튤립"을 검색했을 때, 데이터에는 "튜립"으로 저장되어 있어 단순 문자열 비교만으로는 검색 결과가 나오지 않는 문제가 있었습니다. 외부 API를 통해 경매 정보를 서버에 저장하는 구조기도 했고, 새로운 케이스가 추가될 가능성이 있어서 데이터 자체를 수정하기는 어려웠습니다.''',
    ),
    SearchExplainModel(
      title: '해결',
      explain:
          '''오타나 표기 차이에도 검색 결과가 나오도록 유사어 검색 기능을 구현했습니다. 앱 내 패키지 설치 없이 적용 가능하고 구현 난이도가 적절다고 판단된 레벤슈타인 거리 알고리즘을 선택하여, 두 문자열 간의 편집 거리를 계산하고 일정 거리 이내의 결과를 반환하도록 유틸 함수를 구현했습니다.''',
    ),
  ];

  static const String luckitImage =
      'https://hbyownejvdwhbellhfvu.supabase.co/storage/v1/object/public/ppt/luckit_ppt.png';

  static const List<String> loadingMessages = <String>[
    '오늘의 행운을 가늠할\n비밀 수치를 찾아내는 중',
    '우주의 신비한 주파수를\n맞추고 있어요',
    '운세 점수를 결정할\n실마리를 해독 중',
    '보이지 않는 기운을\n숫자로 바꾸는 중',
    '곧 당신만의 운세 점수가\n드러납니다',
    '거의 다 왔어요!',
  ];

  static const List<LuckitExplainModel> luckitExplainModels =
      <LuckitExplainModel>[
    LuckitExplainModel(
      title: '개발 배경',
      explain:
          '''구름톤(구름 주최 해커톤)에서 완성하지 못했던 앱이지만,\n직접 기획했었고 디자인 완성도가 높아 애착이 있었고, 해커톤 종료 후 방학 동안 개인 프로젝트로 발전시켜 프로젝트를 마무리했습니다.''',
    ),
    LuckitExplainModel(
      title: '프로젝트 성격',
      explain: '팀 프로젝트(구름톤) -> 개인 프로젝트',
    ),
    LuckitExplainModel(
      title: '총 개발 기간',
      explain:
          '구름톤 : 2024.11.21 ~ 2024.11.24\n개인 프로젝트 : 2025.01.06 ~ 2025.02.24',
    ),
    LuckitExplainModel(
      title: '개발 환경',
      explain: '구름톤 : Flutter + Spring Boot\n개인 프로젝트 : Flutter + Supabase',
    ),
    LuckitExplainModel(
      title: '역할',
      explain: '구름톤 : 기획, 프론트엔드 개발 팀장\n개인 프로젝트 : 기획, 프론트엔드, 백엔드 개발까지 전반 담당',
    ),
    LuckitExplainModel(
      title: '핵심 기능',
      explain: 'AI 기반 콘텐츠 생성, 수집형 미니게임',
    ),
    LuckitExplainModel(
      title: '목적',
      explain: '운세와 게임을 기반으로 재미와 일상의 작은 동기부여를 주는 투두리스트 구현',
    ),
  ];

  static const List<GyeonExplainModel> gyeonExplainModels = <GyeonExplainModel>[
    GyeonExplainModel(
      title: '개발 배경',
      explain: '키오스크 주문 대기 시간 동안 메뉴판을 확인할 수 없는 불편함 해소',
    ),
    GyeonExplainModel(
      title: '프로젝트 성격',
      explain: '개인 프로젝트',
    ),
    GyeonExplainModel(
      title: '핵심 기능',
      explain: '모바일/웹 메뉴 확인, 랜덤 메뉴 추천(룰렛 애니메이션)',
    ),
    GyeonExplainModel(
      title: '개발 환경',
      explain: 'Flutter web, Supabase(DB), Vercel(배포)',
    ),
    GyeonExplainModel(
      title: '개발 기간',
      explain: '2025.04.10 ~ 2025.04.11',
    ),
    GyeonExplainModel(
      title: '성과',
      explain: '첫날 사이트 방문자 750명 / 홍보 게시물 좋아요 152, 댓글 39, 스크랩 284',
    ),
  ];

  static const List<GyeonSectionExplainModel> gyeonSectionExplainModels =
      <GyeonSectionExplainModel>[
    GyeonSectionExplainModel(
      id: '0',
      tag: '기획',
      title: '개발 배경',
      subTitle: '에브리 타임 게시글의 불편함 발견!',
      explains: <String>[
        '''대학교 커뮤니티 앱 에브리타임을 보던 중, 학식당에서 기다리는 동안 메뉴판을 확인할 수 없어 불편하다는 문제를 발견했습니다.''',
        '''실제로 일주일 사이 같은 주제로 두 개의 게시글이 올라왔고, 총 500개 가량의 좋아요를 기록한 것을 보고 이 문제가 많은 학생들이 공감하는 불편이라는 점을 확인할 수 있었습니다.''',
        '''이를 해결하기 위해 에브리타임의 게시글까지 들어가지 않고 QR코드를 통해 바로 메뉴판을 확인할 수 있는 웹사이트를 만들면 좋겠다고 생각했습니다.''',
      ],
    ),
    GyeonSectionExplainModel(
      id: '1',
      tag: '기획',
      title: '기능 기획 및 디자인',
      subTitle: '모바일과 PC 모두 대응, 랜덤 음식 뽑기 인터랙션',
      explains: <String>[
        '메뉴판 UI는 모바일과 PC 환경 모두 대응할 수 있도록 반응형으로 개발할 생각을 했습니다.',
        '사이트 체류 시간을 조금이라도 늘리기 위한 부가 기능으로 메뉴 선택을 돕는 랜덤 음식 뽑기 인터랙션을 구현했습니다.',
        'Lottie와 룰렛 애니메이션을 구현해 사용자에게 보는 재미를 주려했습니다.',
        '''추가적으로 혼자 모든 메뉴판 사진을 촬영하기 어렵다고 판단해, 카카오톡 오픈채팅방을 개설하여 학생들의 제보를 받을 수 있는 채널을 마련했습니다.''',
        '제보율을 올리기 위해, 원하는 제보자에 한해 제보자의 닉네임을 메뉴 사진에 표시되도록 기획했습니다.',
      ],
    ),
    GyeonSectionExplainModel(
        id: '2',
        tag: '개발',
        title: 'DB 설계 및 데이터 추출',
        subTitle: 'Supabase를 활용한 DB 설계 및 GPT를 활용한 데이터 추출',
        explains: <String>[
          '백엔드 단을 구현하기 위한 도구로는 Supabase를 활용했습니다.',
          '데이터 베이스 구조는 배달의민족 ERD를 참고해 설계했습니다.',
          '''학식당 메뉴 데이터를 제공받을 곳이 없어서, GPT를 활용해 직접 메뉴판 사진에서 음식명과 가격 텍스트를 추출하고 검수를 거친 뒤 최종 데이터셋을 완성했습니다.''',
        ]),
    GyeonSectionExplainModel(
      id: '3',
      tag: '개발',
      title: '배포',
      subTitle: 'Vercel을 활용한 배포',
      explains: <String>[
        'Vercel을 활용해 배포했습니다.',
        '1. 소규모 프로젝트라 무료로 제공되는 스펙이 충분함',
        '2. 따로 호스팅 서버에 대한 관리를 하지 않아도 됨',
        '3. 도메인 이름을 구매하지 않고도 관련 있는 이름을 사용할 수 있음',
        '4. 자동 배포 기능이 있어 코드 변경 시 자동으로 배포됨',
      ],
    ),
    GyeonSectionExplainModel(
      id: '4',
      tag: '운영',
      title: '홍보',
      subTitle: '에브리타임에 홍보 게시글 작성',
      explains: <String>[
        '홍보는 에브리타임 게시글을 통해 진행했습니다.',
        '2025.04월 기준 좋아요 152개, 댓글 39개, 스크랩 284회를 기록했습니다.',
        '홍보글 업로드 첫날 사이트 방문자 수는 750명을 기록했습니다.',
      ],
    ),
    GyeonSectionExplainModel(
      id: '5',
      tag: '운영',
      title: '운영 결과',
      subTitle: '약 한 학기 동안의 운영한 결과',
      explains: <String>[
        '약 한 학기 동안 운영한 결과, 첫날의 임팩트와 달리, 평일 DAU는 10~20명 수준을 유지했습니다.',
        '(메인 화면 접속 시 호출되는 API를 기준으로 추정)',
        '카카오톡 오픈채팅을 통해 6명의 학생이 메뉴판 사진을 제보해 주었고, 총 14장의 사진을 등록할 수 있었습니다.',
      ],
    ),
  ];
}
