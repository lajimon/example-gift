FROM openjdk:15-slim
LABEL maintainer="minseok.lee@sk.com"
EXPOSE 18080
ENV DB_HOST=localhost \
    DB_PORT=3306 \
    ORDER_BASE_URL=http://localhost
COPY build/libs/gift-0.0.1-SNAPSHOT.jar app.jar
CMD java -jar /app.war --spring.datasource.hikari.jdbc-url="jdbc:mysql://${DB_HOST}:${DB_PORT}/order?serverTimezone=UTC&characterEncoding=UTF-8" \
     --spring.datasource.hikari.username="${DB_USERNAME}" --spring.datasource.hikari.password="${DB_PASSWORD}" \
     --spring.flyway.url="jdbc:mysql://${DB_HOST}:${DB_PORT}/order?serverTimezone=UTC&characterEncoding=UTF-8" \
     --spring.flyway.username="${DB_USERNAME}" \
     --spring.flyway.password="${DB_PASSWORD}" \
     --example.order.base-url="${ORDER_BASE_URL"