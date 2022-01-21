/***********************************************************************************************************************************************/
/********************************************************** PRODUCTS *******************************************************************************/
/***********************************************************************************************************************************************/




CREATE TABLE public.products
(
    product_id integer NOT NULL,
    title character varying(255) COLLATE pg_catalog."default",
    price numeric,
    created_at timestamp with time zone,
    deleted_at timestamp with time zone,
    tags character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT products_pkey PRIMARY KEY (product_id)
);



/***********************************************************************************************************************************************/
/********************************************************** USERS *******************************************************************************/
/***********************************************************************************************************************************************/

CREATE TABLE public.users
(
    user_id integer NOT NULL,
    email character varying(255) COLLATE pg_catalog."default",
    password character varying(255) COLLATE pg_catalog."default",
    created_at timestamp with time zone,
    deleted_at timestamp with time zone,
    CONSTRAINT users_pkey PRIMARY KEY (user_id)
);

/***********************************************************************************************************************************************/
/******************************************************* PURCHASES *****************************************************************************/
/***********************************************************************************************************************************************/


CREATE TABLE public.purchases
(
    purchase_id integer NOT NULL,
    created_at timestamp with time zone,
    name character varying(255) COLLATE pg_catalog."default",
    address character varying(255) COLLATE pg_catalog."default",
    state character varying(2) COLLATE pg_catalog."default",
    zipcode integer,
    user_id integer,
    CONSTRAINT purchases_pkey PRIMARY KEY (purchase_id),
    CONSTRAINT purchases_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

/***********************************************************************************************************************************************/
/********************************************* PURCHASE ITEMS **********************************************************************************/
/***********************************************************************************************************************************************/

CREATE TABLE public.purchase_items
(
    purchase_items_id integer NOT NULL,
    purchase_id integer,
    product_id integer,
    price numeric,
    quantity integer,
    status character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT purchase_items_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.products (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT purchase_items_purchase_id_fkey FOREIGN KEY (purchase_id)
        REFERENCES public.purchases (purchase_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);