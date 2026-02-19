#uygulamanın çalışması için JRE lazımw
#FROM ubuntu:latest
FROM eclipse-temurin:21-jre-alpine

#projenin jar dosyası burada
ARG JAR_FILE=target/*.jar

#projenin jar halini docker icine kopyala
COPY ${JAR_FILE} devops-application.jar

#uygulamaların iç portunu sabitle
EXPOSE 8080


#uygulamayı java komutla çalıştır
ENTRYPOINT ["java","-jar","/devops-application.jar"]