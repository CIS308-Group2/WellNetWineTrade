DROP SEQUENCE SEQ_USER_ACCOUNT;
DROP SEQUENCE SEQ_BUSINESS_ACCOUNT;
DROP SEQUENCE SEQ_ACCOUNT_TYPE;
DROP SEQUENCE SEQ_BIO_TRANSLATION;
DROP SEQUENCE SEQ_WINE;
DROP SEQUENCE SEQ_WINE_IMAGE;
DROP SEQUENCE SEQ_WINE_TRANSLATION;
DROP SEQUENCE SEQ_IMPORT_ORDER;
DROP SEQUENCE SEQ_ORDER_ITEM;

DROP TABLE USER_ACCOUNT CASCADE CONSTRAINTS;
DROP TABLE BUSINESS_ACCOUNT CASCADE CONSTRAINTS;
DROP TABLE ACCOUNT_TYPE CASCADE CONSTRAINTS;
DROP TABLE WINERY_BIO CASCADE CONSTRAINTS;
DROP TABLE BIO_TRANSLATION CASCADE CONSTRAINTS;
DROP TABLE WINE CASCADE CONSTRAINTS;
DROP TABLE WINE_IMAGE CASCADE CONSTRAINTS;
DROP TABLE WINE_TRANSLATION CASCADE CONSTRAINTS;
DROP TABLE IMPORT_ORDER CASCADE CONSTRAINTS;
DROP TABLE ORDER_ITEM CASCADE CONSTRAINTS;
