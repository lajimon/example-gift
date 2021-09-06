FROM openjdk:15-slim
LABEL maintainer="minseok.lee@sk.com"
EXPOSE 18080
COPY build/libs/gift-0.0.1-SNAPSHOT.war app.war
CMD ["java","-jar","/app.war"]