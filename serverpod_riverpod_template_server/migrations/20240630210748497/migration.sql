BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "note" (
    "id" serial PRIMARY KEY,
    "text" text NOT NULL
);


--
-- MIGRATION VERSION FOR serverpod_riverpod_template
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_riverpod_template', '20240630210748497', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240630210748497', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
