spring_security_blog_sample
===========================

Spring Security 관련 Sample Code

1. 개발 환경은 다음과 같다
- JDK 6
- Tomcat 7.0.50
- Oracle 11g
- Spring Tool Suite 3.6.1
- Spring framework 3.2.9
- Spring Security 3.2.4

2. github 을 이용해서 처음 작업하다보니 github으로 올라가는 구조가 maven 구조와 좀 다른 부분이 있어 보인다.
이 부분은 github이 원래 이렇게 만드는지 알 수는 없으나 maven 구조로 되어 있기 때문에 import가 제대로 안될 경우 
copy & paste로 작업하면 될듯 하다

3. Data Source는 Tomcat Connection Pool을 이용해서 만들었으며 이에 대한 정보는 src\main\webapp\META-INF\context.xml에 있다.
Spring에서는 JNDI를 이용해서 접근하고 있다

4. Log 라이브러리는 slf4j를 이용하는 logback 라이브러리를 사용했다

5. SQL Query 출력을 위해 log4jdbc-log4j2 라이브러리(https://code.google.com/p/log4jdbc-log4j2/)를 사용했다.
이로 인해 Data Source 사용시 그냥 사용한 것이 아닌 log4jdbc-log4j2에서 제공하는 DataSource를 사용했다
(src\main\webapp\WEB-INF\spring\root-context.xml 파일의 설정 내용을 보면 이해할 수 있다)

6. DB 테이블과 데이터 생성 쿼리는 src\main\webapp\WEB-INF\sql 디렉토리에 있는 table.sql과 data.sql이다.
table.sql은 테이블과 primary key 생성 쿼리가, data.sql은 생성된 테이블에 데이터를 넣는 insert 쿼리이다.
Oracle 쿼리이기 때문에 다른 DBMS를 사용할 경우 수정해야 할 수도 있음을 알린다

7. 처음 초기 화면은 http://localhost:8080/main.do 이다.
