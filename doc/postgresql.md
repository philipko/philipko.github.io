Postgresql Note
=======


timestamp without time zone DEFAULT
----------


```
-- 查看時區設定

SELECT current_setting('TIMEZONE');
+-----------------+
| current_setting |
+-----------------+
| Asia/Taipei     |
+-----------------+

-- 一個是 timestamp without timezone, 一個是 timestamp with timezone
-- 後面的+8 代表現在時區設定與UTC +8小時
select localtimestamp, current_timestamp;
+----------------------------+-------------------------------+
|       localtimestamp       |       current_timestamp       |
+----------------------------+-------------------------------+
| 2019-08-22 23:19:36.342856 | 2019-08-22 23:19:36.342856+08 |
+----------------------------+-------------------------------+

-- PostgreSQL 只要設定好Server所在的時區,就可以了喔
-- 不需要搞什麼設成UTC,再加8小時.
-- 你上面的 trigger 就是不加8小時啊. default 是自己加8小時.
-- 兩邊不一致.PostgreSQL 是依照你給的規則做的.
-- 只是你以沒有時區觀念的資料庫,來去做自行調整,又不一致.
-- 而PostgreSQL 與 Oracle 都是有時區觀念的,完全不需要如此麻煩.
-- 只要確定所在時區正確,就會自動產生正確的時間.

-- 甚至還可以用 extract() 來取出 timezone , 相對於 UTC的差距秒數.
-- 當然裡面的時間型態是要 with timezone的
select extract(timezone from current_timestamp) / 3600
     , extract(timezone from now()) / 3600;

+----------+----------+
| ?column? | ?column? |
+----------+----------+
|        8 |        8 |
+----------+----------+

--  離UTC 8小時.

-- 若你堅持,非要這樣做,也不必用那個 before update trigger.
-- 在create table 裡的default 後面補上 on update ,然後接你想要的運算式.
-- 應該是跟default 一樣是 + interval '8 hours'
-- 這樣update時,一樣是加了8小時.
回應 2 分享檢舉

40527145 iT邦新手 5 級 ‧ 2019-09-06 14:50:02檢舉
感謝大大的回答我成功完成了
但顯示的時間會是
2019-09-06 14:40:58.825583
如何去掉小數點
我只想要顯示
2019-09-06 14:40:58

目前的程式

create or replace function upd_timestamp() returns trigger as
$$
begin
  new.modified = current_timestamp ;
  set timezone to 'Asia/Taipei';
  return new;
end
$$
language plpgsql;
 
drop table if exists "public"."score";
CREATE SEQUENCE "public"."score_serno_seq" START 200;
create table "public"."score" (
  "serno" int4 NOT NULL DEFAULT nextval('score_serno_seq'::regclass),
  "length" varchar(20) COLLATE "pg_catalog"."default" ,
  "width" varchar(20) COLLATE "pg_catalog"."default",
  "area" varchar(20) COLLATE "pg_catalog"."default",
  "Lcircle" varchar(20) COLLATE "pg_catalog"."default",
  "Scircle" varchar(20) COLLATE "pg_catalog"."default",
  "Cdistance" varchar(20) COLLATE "pg_catalog"."default",
  "modified" timestamp default current_timestamp);
set timezone to 'Asia/Taipei';
create trigger t_name before update on "public"."score" for each row execute procedure upd_timestamp();

```

[Postgresql TIMESTAMP無法更新正確時間](https://ithelp.ithome.com.tw/questions/10194979)

