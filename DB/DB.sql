DROP DATABASE IF EXISTS myWebsite;
CREATE DATABASE myWebsite;
USE myWebsite;

CREATE TABLE board
(
    boardId INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '게시물 인덱스',
    memberId INT(10) UNSIGNED NOT NULL COMMENT '작성자 인덱스',
    title VARCHAR(100) NOT NULL COMMENT '제목',
    `body` TEXT NOT NULL COMMENT '내용',
    hashtag VARCHAR(255) COMMENT '해시태그 목록',
    regDate DATETIME NOT NULL DEFAULT NOW() COMMENT '생성일',
    updDate DATETIME NOT NULL DEFAULT NOW() COMMENT '수정일',
    hitCnt INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '조회수',
    FOREIGN KEY (memberId) REFERENCES `member` (memberId)
);

CREATE TABLE `member`
(
    memberId INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '작성자 인덱스',
    loginId VARCHAR(100) NOT NULL COMMENT '이메일 아이디',
    loginPw VARCHAR(100) NOT NULL COMMENT '비밀번호',
    authLv TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '권한 레벨(회원=0, 관리자=1)',
    regDate DATETIME NOT NULL DEFAULT NOW() COMMENT '생성일',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부(미탈퇴=0, 탈퇴=1)'
);

CREATE TABLE `img`
(
    imgId INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '이미지 인덱스',
    boardId INT(10) UNSIGNED NOT NULL COMMENT '게시물 인덱스',
    originalName VARCHAR(500) NOT NULL COMMENT '원본 이름',
    storePath VARCHAR(500) NOT NULL COMMENT '저장 경로',
    size INT(15) UNSIGNED NOT NULL COMMENT '용량',
    regDate DATETIME NOT NULL DEFAULT NOW() COMMENT '생성일',
    FOREIGN KEY (boardId) REFERENCES board (boardId)
);

CREATE TABLE `comment`
(
    commId INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '댓글 인덱스',
    boardId INT(10) UNSIGNED NOT NULL COMMENT '게시물 인덱스',
    memberId INT(10) UNSIGNED NOT NULL COMMENT '작성자 인덱스',
    commBody VARCHAR(200) NOT NULL COMMENT '내용',
    regDate DATETIME NOT NULL DEFAULT NOW() COMMENT '생성일',
    updDate DATETIME NOT NULL DEFAULT NOW() COMMENT '수정일',
    FOREIGN KEY (boardId) REFERENCES board (boardId),
    FOREIGN KEY (memberId) REFERENCES `member` (memberId)
);
    
# 테스트 데이터

INSERT INTO `member`
(
    memberId,
    loginId,
    loginPw,
    authLv,
    regDate,
    delStatus
)
VALUES
(
    1,
    'admin',
    'admin',
    1,
    NOW(),
    0
);

INSERT INTO board
(
    boardId,
    memberId,
    title,
    `body`,
    hashtag,
    regDate,
    updDate,
    hitCnt
)
VALUES
(
    1,
    1,
    '제목1',
    '내용1',
    '안녕,반가워,이건,해시태그',
    NOW(),
    NOW(),
    0
)

INSERT INTO board
(
    boardId,
    memberId,
    title,
    `body`,
    hashtag,
    regDate,
    updDate,
    hitCnt
)
VALUES
(
    2,
    1,
    '제목2',
    '내용2',
    '안녕,해,시,태,그',
    NOW(),
    NOW(),
    0
)

INSERT INTO board
(
    boardId,
    memberId,
    title,
    `body`,
    hashtag,
    regDate,
    updDate,
    hitCnt
)
VALUES
(
    3,
    1,
    '제목3',
    '내용3',
    '안녕,해시,태,그',
    NOW(),
    NOW(),
    0
)

SELECT * FROM board
SELECT * FROM board WHERE hashtag LIKE CONCAT('%', '해시', '%')
SELECT * FROM board WHERE CONCAT(',',hashtag,',') LIKE CONCAT('%,','해시',',%')