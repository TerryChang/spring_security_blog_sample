/*------------------------------------------------------------------------------
회원 정보 테이블로 primary key 성격을 하는 컬럼은 ID 컬럼이다.
------------------------------------------------------------------------------*/
CREATE TABLE MEMBERINFO (
  ID          VARCHAR2(50)      NOT NULL, 
  PASSWORD    VARCHAR2(300)     NOT NULL, 
  NAME        VARCHAR2(30)      NOT NULL
);

COMMENT ON TABLE MEMBERINFO IS '회원정보 테이블';

COMMENT ON COLUMN MEMBERINFO.ID IS '로그인 아이디';

COMMENT ON COLUMN MEMBERINFO.PASSWORD IS '로그인 비밀번호';

COMMENT ON COLUMN MEMBERINFO.NAME IS '회원 이름';

ALTER TABLE MEMBERINFO ADD
(
    CONSTRAINT PK_MEMBERINFO
    PRIMARY KEY ( ID )
    USING INDEX    
);


/*------------------------------------------------------------------------------
권한 정보 테이블로 primary key 역할을 하는 컬럼은 AUTHORITY 컬럼이다.
------------------------------------------------------------------------------*/
CREATE TABLE AUTHORITY (
  AUTHORITY         VARCHAR2(50)     NOT NULL, 
  AUTHORITY_NAME    VARCHAR2(50)         NULL
);

COMMENT ON TABLE AUTHORITY IS '권한 테이블';

COMMENT ON COLUMN AUTHORITY.AUTHORITY IS '권한 코드';

COMMENT ON COLUMN AUTHORITY.AUTHORITY_NAME IS '권한 이름(권한 설명)';

ALTER TABLE AUTHORITY ADD
(
    CONSTRAINT PK_AUTHORITY
    PRIMARY KEY ( AUTHORITY )
    USING INDEX
);


/*------------------------------------------------------------------------------
회원이 가지고 있는 권한을 나타내는 테이블
------------------------------------------------------------------------------*/
CREATE TABLE MEMBER_AUTHORITY (
  ID           VARCHAR2(50)     NOT NULL, 
  AUTHORITY    VARCHAR2(50)     NOT NULL
);

COMMENT ON TABLE MEMBER_AUTHORITY IS '회원-권한 테이블';

COMMENT ON COLUMN MEMBER_AUTHORITY.ID IS '회원 ID';

COMMENT ON COLUMN MEMBER_AUTHORITY.AUTHORITY IS '권한 ID';

/*------------------------------------------------------------------------------
권한 그룹 기본 정보 테이블
------------------------------------------------------------------------------*/
CREATE TABLE GROUPS (
  ID            NUMBER           NOT NULL, 
  GROUP_NAME    VARCHAR2(50)         NULL
);

COMMENT ON TABLE GROUPS IS '권한 그룹';

COMMENT ON COLUMN GROUPS.ID IS '권한 그룹  ID';

COMMENT ON COLUMN GROUPS.GROUP_NAME IS '권한 그룹명';

ALTER TABLE GROUPS ADD
(
    CONSTRAINT PK_GROUPS
    PRIMARY KEY ( ID )
    USING INDEX
);



/*------------------------------------------------------------------------------
권한 그룹별 사용자 정보 테이블
------------------------------------------------------------------------------*/
CREATE TABLE GROUPS_MEMBER (
  GROUP_ID     NUMBER           NOT NULL, 
  MEMBER_ID    VARCHAR2(50)         NULL
);

COMMENT ON TABLE GROUPS_MEMBER IS '권한 그룹별 사용자';

COMMENT ON COLUMN GROUPS_MEMBER.GROUP_ID IS '권한 그룹  ID';

COMMENT ON COLUMN GROUPS_MEMBER.MEMBER_ID IS '로그인 ID';


/*------------------------------------------------------------------------------
권한 그룹별 소유 권한 정보 테이블
------------------------------------------------------------------------------*/
CREATE TABLE GROUPS_AUTHORITY (
  GROUP_ID     NUMBER           NOT NULL, 
  AUTHORITY    VARCHAR2(50)         NULL
);

COMMENT ON TABLE GROUPS_AUTHORITY IS '권한 그룹별 소유 권한';

COMMENT ON COLUMN GROUPS_AUTHORITY.GROUP_ID IS '권한 그룹  ID';

COMMENT ON COLUMN GROUPS_AUTHORITY.AUTHORITY IS '권한 코드';


/*------------------------------------------------------------------------------
접근 관리 대상이 되는 리소스(URL, 메소드) 테이블
------------------------------------------------------------------------------*/
CREATE TABLE SECURED_RESOURCES (
  RESOURCE_ID         VARCHAR2(10)      NOT NULL, 
  RESOURCE_NAME       VARCHAR2(50)          NULL, 
  RESOURCE_PATTERN    VARCHAR2(100)     NOT NULL, 
  RESOURCE_TYPE       VARCHAR2(10)          NULL, 
  SORT_ORDER          NUMBER                NULL
);

COMMENT ON TABLE SECURED_RESOURCES IS '리소스 테이블';

COMMENT ON COLUMN SECURED_RESOURCES.RESOURCE_ID IS '리소스 ID';

COMMENT ON COLUMN SECURED_RESOURCES.RESOURCE_NAME IS '리소스 이름';

COMMENT ON COLUMN SECURED_RESOURCES.RESOURCE_PATTERN IS '리소스 패턴';

COMMENT ON COLUMN SECURED_RESOURCES.RESOURCE_TYPE IS '리소스 타입(url : URL, method : Method)';

COMMENT ON COLUMN SECURED_RESOURCES.SORT_ORDER IS '순서';

ALTER TABLE SECURED_RESOURCES ADD
(
    CONSTRAINT PK_SECURED_RESOURCES
    PRIMARY KEY ( RESOURCE_ID )
    USING INDEX
);

/*------------------------------------------------------------------------------
리소스(URL, 메소드) 테이블
------------------------------------------------------------------------------*/
CREATE TABLE SECURED_RESOURCES_AUTHORITY (
  RESOURCE_ID    VARCHAR2(10)     NOT NULL, 
  AUTHORITY      VARCHAR2(50)     NOT NULL
);

COMMENT ON TABLE SECURED_RESOURCES_AUTHORITY IS '리소스에 따른 접근 권한 테이블';

COMMENT ON COLUMN SECURED_RESOURCES_AUTHORITY.RESOURCE_ID IS '리소스 ID';

COMMENT ON COLUMN SECURED_RESOURCES_AUTHORITY.AUTHORITY IS '권한';

ALTER TABLE SECURED_RESOURCES_AUTHORITY ADD
(
    CONSTRAINT PK_SECURED_RESOURCES_ROLE
    PRIMARY KEY ( RESOURCE_ID, AUTHORITY )
    USING INDEX    
);

