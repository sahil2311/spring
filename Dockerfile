# ---- Dependencies ----

FROM maven AS build

COPY . .

RUN mvn clean package

#app image

FROM store/oracle/serverjre:8

WORKDIR /root/

COPY --from=build target .

COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
