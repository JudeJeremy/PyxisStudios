--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: user_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_role AS ENUM (
    'customer',
    'driver',
    'admin'
);


ALTER TYPE public.user_role OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- Name: create_restaurant_for_admin(uuid, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_restaurant_for_admin(admin_id uuid, restaurant_name text, restaurant_description text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$

BEGIN

  INSERT INTO restaurants (name, description, admin_id)

  VALUES (restaurant_name, restaurant_description, admin_id);

END;

$$;


ALTER FUNCTION public.create_restaurant_for_admin(admin_id uuid, restaurant_name text, restaurant_description text) OWNER TO postgres;

--
-- Name: create_user_profile_and_restaurant(uuid, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.create_user_profile_and_restaurant(user_id uuid, user_role text, rest_name text DEFAULT NULL::text, rest_description text DEFAULT NULL::text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$

BEGIN

  -- Start a transaction

  BEGIN

    -- Insert or update the user profile

    INSERT INTO profiles (id, role)

    VALUES (user_id, user_role)

    ON CONFLICT (id) DO UPDATE

    SET role = EXCLUDED.role;



    -- If the user is an admin and restaurant details are provided, create the restaurant

    IF user_role = 'admin' AND rest_name IS NOT NULL THEN

      INSERT INTO restaurants (name, description, admin_id)

      VALUES (rest_name, rest_description, user_id);

    END IF;



    -- If we reach this point without errors, commit the transaction

    COMMIT;

  EXCEPTION

    WHEN OTHERS THEN

      -- If there is any error, roll back the transaction

      ROLLBACK;

      RAISE;

  END;

END;

$$;


ALTER FUNCTION public.create_user_profile_and_restaurant(user_id uuid, user_role text, rest_name text, rest_description text) OWNER TO postgres;

--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$

BEGIN

  INSERT INTO public.profiles (id, role)

  VALUES (NEW.id, 'customer')

  ON CONFLICT (id) DO NOTHING;

  RETURN NEW;

END;

$$;


ALTER FUNCTION public.handle_new_user() OWNER TO postgres;

--
-- Name: register_admin_and_create_restaurant(uuid, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.register_admin_and_create_restaurant(admin_id uuid, rest_name text, rest_description text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$

BEGIN

  -- Insert the admin's role into the profiles table

  INSERT INTO profiles (id, role)

  VALUES (admin_id, 'admin')

  ON CONFLICT (id) DO UPDATE SET role = 'admin';



  -- Create a restaurant for the admin

  INSERT INTO restaurants (name, description, admin_id)

  VALUES (rest_name, rest_description, admin_id);

END;

$$;


ALTER FUNCTION public.register_admin_and_create_restaurant(admin_id uuid, rest_name text, rest_description text) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    category text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    image_url text,
    restaurant_id integer
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_items_id_seq OWNER TO postgres;

--
-- Name: menu_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_id_seq OWNED BY public.menu_items.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer,
    menu_item_id integer,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id uuid,
    total_price numeric(10,2) NOT NULL,
    status text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    restaurant_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    role text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    restaurant_id integer
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurants (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    admin_id uuid,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.restaurants OWNER TO postgres;

--
-- Name: restaurants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restaurants_id_seq OWNER TO postgres;

--
-- Name: restaurants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurants_id_seq OWNED BY public.restaurants.id;


--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    id bigint NOT NULL,
    topic text NOT NULL,
    extension text NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE SEQUENCE realtime.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE realtime.messages_id_seq OWNER TO supabase_realtime_admin;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER SEQUENCE realtime.messages_id_seq OWNED BY realtime.messages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER VIEW vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: menu_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN id SET DEFAULT nextval('public.menu_items_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: restaurants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants ALTER COLUMN id SET DEFAULT nextval('public.restaurants_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages ALTER COLUMN id SET DEFAULT nextval('realtime.messages_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	5c9c5636-cc55-41be-849d-0a2228acf88a	{"action":"user_confirmation_requested","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-21 00:45:01.997696+00	
00000000-0000-0000-0000-000000000000	91d55161-2f36-455e-a006-796172f9ad10	{"action":"user_signedup","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-09-21 00:45:26.609579+00	
00000000-0000-0000-0000-000000000000	35b7322e-4a48-4c44-9cc9-6cbd86006ce4	{"action":"logout","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-09-21 00:45:41.2946+00	
00000000-0000-0000-0000-000000000000	f3b146f2-4bdc-450f-b966-09abd159102c	{"action":"user_recovery_requested","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user"}	2024-09-22 03:45:17.331418+00	
00000000-0000-0000-0000-000000000000	907fc2f1-24bb-4d1a-96e7-241c42621545	{"action":"login","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-09-22 03:46:22.774855+00	
00000000-0000-0000-0000-000000000000	28647eee-19e6-47bf-8f7c-95365cdae4a4	{"action":"user_repeated_signup","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-22 04:26:32.680902+00	
00000000-0000-0000-0000-000000000000	488c5446-20c0-4687-9842-33c67ecb1318	{"action":"user_repeated_signup","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-22 04:27:50.163788+00	
00000000-0000-0000-0000-000000000000	aedd6d42-eadd-40b5-b8cb-c9bce8cf5c83	{"action":"user_repeated_signup","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-22 04:28:35.836697+00	
00000000-0000-0000-0000-000000000000	13a3bbbe-3196-4bc5-abda-a7262ce0c0ba	{"action":"user_repeated_signup","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-22 04:28:50.423884+00	
00000000-0000-0000-0000-000000000000	380d22c7-1845-471a-ad74-9eff6f4dbaf8	{"action":"token_refreshed","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-09-22 07:55:27.853591+00	
00000000-0000-0000-0000-000000000000	0192a2a0-c82a-4454-95d3-ae0dd8129865	{"action":"token_revoked","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-09-22 07:55:27.861574+00	
00000000-0000-0000-0000-000000000000	37b32c53-0ee5-470d-9a4d-cf41c27f13c4	{"action":"user_confirmation_requested","actor_id":"d67ee3c1-dbaf-4898-9f3d-de4acf6ed1ef","actor_username":"tepifeh692@nastyx.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-22 07:56:37.224627+00	
00000000-0000-0000-0000-000000000000	7fd190bb-d4bf-4ba0-b7dd-4329db1ef119	{"action":"user_signedup","actor_id":"d67ee3c1-dbaf-4898-9f3d-de4acf6ed1ef","actor_username":"tepifeh692@nastyx.com","actor_via_sso":false,"log_type":"team"}	2024-09-22 07:56:54.000398+00	
00000000-0000-0000-0000-000000000000	9043d329-d8da-46db-9957-0ea38e3862dd	{"action":"logout","actor_id":"d67ee3c1-dbaf-4898-9f3d-de4acf6ed1ef","actor_username":"tepifeh692@nastyx.com","actor_via_sso":false,"log_type":"account"}	2024-09-22 07:57:02.872959+00	
00000000-0000-0000-0000-000000000000	57643c21-d61c-443c-8bc1-f3428ed5835e	{"action":"user_repeated_signup","actor_id":"d67ee3c1-dbaf-4898-9f3d-de4acf6ed1ef","actor_username":"tepifeh692@nastyx.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-22 07:58:00.393913+00	
00000000-0000-0000-0000-000000000000	ca9c9116-6073-45f3-ac4f-ba81091e12e5	{"action":"user_repeated_signup","actor_id":"d67ee3c1-dbaf-4898-9f3d-de4acf6ed1ef","actor_username":"tepifeh692@nastyx.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-22 11:53:22.21664+00	
00000000-0000-0000-0000-000000000000	25feca87-6eec-49fa-9220-c0f98b5cc719	{"action":"user_repeated_signup","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-22 11:54:22.503233+00	
00000000-0000-0000-0000-000000000000	6a92c105-d980-4f16-9969-47fac8032dab	{"action":"user_confirmation_requested","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-23 05:22:01.891555+00	
00000000-0000-0000-0000-000000000000	d1fbbc65-6205-4658-9e8d-f14ec2ba2e75	{"action":"user_repeated_signup","actor_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-23 05:22:34.508683+00	
00000000-0000-0000-0000-000000000000	92d889b4-e6b0-4db2-9e9e-012fac4c685c	{"action":"user_repeated_signup","actor_id":"d67ee3c1-dbaf-4898-9f3d-de4acf6ed1ef","actor_username":"tepifeh692@nastyx.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-23 05:23:55.081519+00	
00000000-0000-0000-0000-000000000000	3514e704-282a-415d-b90d-08d45b67fc64	{"action":"user_confirmation_requested","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-23 05:34:28.23497+00	
00000000-0000-0000-0000-000000000000	5a31d61e-57a4-484d-ad05-5ed974a8234e	{"action":"user_signedup","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"team"}	2024-09-23 05:35:34.64259+00	
00000000-0000-0000-0000-000000000000	d2f601ab-92f2-4c57-808e-7203fbd1b00a	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 05:42:26.84397+00	
00000000-0000-0000-0000-000000000000	177b24c8-cfc1-412d-8f42-24b066fbb1a6	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-09-23 05:47:17.34252+00	
00000000-0000-0000-0000-000000000000	f4f8f6e9-8cec-434d-93e2-488154402bcb	{"action":"user_repeated_signup","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-23 05:47:24.282735+00	
00000000-0000-0000-0000-000000000000	b8aab637-9491-4673-9c80-6e131addd20d	{"action":"user_repeated_signup","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-23 05:51:30.261147+00	
00000000-0000-0000-0000-000000000000	a75c9064-4fee-4d4a-8ed9-06d382081a68	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 05:51:35.195456+00	
00000000-0000-0000-0000-000000000000	78fd9a70-9830-403d-a863-3273d49470c8	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 05:52:28.031165+00	
00000000-0000-0000-0000-000000000000	bb36978e-8dc0-4c0f-aaab-eb02b6653fe4	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-09-23 05:56:05.954955+00	
00000000-0000-0000-0000-000000000000	47a952db-7d8d-4455-bd77-c6e51e3c69a5	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 05:56:07.961816+00	
00000000-0000-0000-0000-000000000000	1c6012e9-2222-4a33-8284-aee6bd39b18c	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 05:58:05.720814+00	
00000000-0000-0000-0000-000000000000	b2804652-1639-4b6a-9d34-c49769e6faad	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-09-23 05:58:16.014223+00	
00000000-0000-0000-0000-000000000000	f60ffdf1-e332-4113-bdfc-c2262c0ffb61	{"action":"user_confirmation_requested","actor_id":"1b559f9a-3402-4a0e-8d1a-0ba3b6b826d8","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-23 06:01:06.152729+00	
00000000-0000-0000-0000-000000000000	36ac0f5b-6501-4119-8eb1-7ed5e93161b4	{"action":"user_signedup","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-09-23 06:02:33.772088+00	
00000000-0000-0000-0000-000000000000	3bf80350-a60a-4181-a7de-679755c5340b	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 06:03:09.674206+00	
00000000-0000-0000-0000-000000000000	1a47d356-41bd-4638-a072-160c7b72e486	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 06:07:01.05764+00	
00000000-0000-0000-0000-000000000000	a9633e25-78eb-4a8e-b439-7c6f26c13325	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 06:10:15.073446+00	
00000000-0000-0000-0000-000000000000	93b973c1-190f-442b-8407-1cdb18b07905	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 06:12:16.837596+00	
00000000-0000-0000-0000-000000000000	758ac7c3-275b-4859-ac31-17adf9df8403	{"action":"logout","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-09-23 06:14:00.666234+00	
00000000-0000-0000-0000-000000000000	ac6a1369-2c91-4ecb-9576-7d7315f3f9d8	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 06:14:10.134336+00	
00000000-0000-0000-0000-000000000000	592b587a-e1a0-433d-9f6c-e07b6509b172	{"action":"logout","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-09-23 06:14:32.893464+00	
00000000-0000-0000-0000-000000000000	6aaec596-4631-4862-9dfa-caf552c59996	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 06:14:50.798811+00	
00000000-0000-0000-0000-000000000000	a71efaca-f79b-4701-802a-d0bc03250d22	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 06:14:53.874413+00	
00000000-0000-0000-0000-000000000000	68f8c743-6ae0-4cf2-af17-6f4c7c336a30	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 06:23:03.463488+00	
00000000-0000-0000-0000-000000000000	d77f130b-838b-43c0-a6e7-735e3e629c90	{"action":"logout","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-09-23 06:26:31.388925+00	
00000000-0000-0000-0000-000000000000	8c04cd5c-c31c-48af-a21c-7ef026a497a4	{"action":"user_confirmation_requested","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-23 06:26:44.445465+00	
00000000-0000-0000-0000-000000000000	0ce90b80-321c-47be-a181-5baccf585071	{"action":"user_signedup","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-09-23 06:30:58.815609+00	
00000000-0000-0000-0000-000000000000	899faf6f-0630-476f-9fd9-57e9bcc91e93	{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"supabase_admin","actor_via_sso":false,"log_type":"team","traits":{"user_email":"pyxisdevlog@gmail.com","user_id":"4e3a5985-a043-44d6-a45f-6d8c8b3d724d"}}	2024-09-23 06:35:36.762185+00	
00000000-0000-0000-0000-000000000000	984eafca-c14f-4b08-a6e4-084e4e576ccb	{"action":"user_signedup","actor_id":"4e3a5985-a043-44d6-a45f-6d8c8b3d724d","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-09-23 06:35:50.154879+00	
00000000-0000-0000-0000-000000000000	74f8723e-8cd3-4afa-9762-75bf7cb5361a	{"action":"logout","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-09-23 06:40:38.882556+00	
00000000-0000-0000-0000-000000000000	84ff8e7d-758f-476b-bd7d-da2a8a0c835c	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 06:40:46.858042+00	
00000000-0000-0000-0000-000000000000	5e4674af-7d78-4945-af02-41636e84b85a	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 06:41:39.878543+00	
00000000-0000-0000-0000-000000000000	65704eb0-faa3-492a-9fc9-b73cacd45d7f	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-23 06:41:44.010461+00	
00000000-0000-0000-0000-000000000000	b21d4c39-7bf3-41ff-a0d7-e6ae3cfe16ad	{"action":"token_refreshed","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-09-24 10:33:31.378118+00	
00000000-0000-0000-0000-000000000000	3f30a817-ed1a-481b-9fec-89ed838a3be6	{"action":"token_revoked","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-09-24 10:33:31.3847+00	
00000000-0000-0000-0000-000000000000	bccc4bb5-1720-4c97-a3a7-f8abcf3b4182	{"action":"logout","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-09-24 10:34:18.280442+00	
00000000-0000-0000-0000-000000000000	b6fa1077-78a0-47d7-a068-f292ef0bdac8	{"action":"user_confirmation_requested","actor_id":"838b1d52-d42a-40f8-97be-175f6ff7cbb9","actor_username":"trason622@fintning.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-24 10:35:54.563114+00	
00000000-0000-0000-0000-000000000000	ed65e723-5ba7-4dea-9110-8e38a89d358b	{"action":"user_signedup","actor_id":"838b1d52-d42a-40f8-97be-175f6ff7cbb9","actor_username":"trason622@fintning.com","actor_via_sso":false,"log_type":"team"}	2024-09-24 10:36:12.980066+00	
00000000-0000-0000-0000-000000000000	f3edb05b-ae1a-41ca-a149-64cf5628d980	{"action":"token_refreshed","actor_id":"838b1d52-d42a-40f8-97be-175f6ff7cbb9","actor_username":"trason622@fintning.com","actor_via_sso":false,"log_type":"token"}	2024-09-24 12:18:44.550771+00	
00000000-0000-0000-0000-000000000000	9eaf5832-f268-4d4e-954c-465841293654	{"action":"token_revoked","actor_id":"838b1d52-d42a-40f8-97be-175f6ff7cbb9","actor_username":"trason622@fintning.com","actor_via_sso":false,"log_type":"token"}	2024-09-24 12:18:44.552144+00	
00000000-0000-0000-0000-000000000000	5bdd855d-df36-4cb2-92fa-e120b35a5472	{"action":"logout","actor_id":"838b1d52-d42a-40f8-97be-175f6ff7cbb9","actor_username":"trason622@fintning.com","actor_via_sso":false,"log_type":"account"}	2024-09-24 12:30:39.192694+00	
00000000-0000-0000-0000-000000000000	47d5c723-2e38-4860-946c-3c235a7b2567	{"action":"user_confirmation_requested","actor_id":"08e3bc77-b331-430e-97e3-b27c561357d8","actor_username":"65wpn@rustyload.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-24 12:31:23.711937+00	
00000000-0000-0000-0000-000000000000	2c64e560-bbe7-4900-b7d3-8450c7a5bbc2	{"action":"user_confirmation_requested","actor_id":"08e3bc77-b331-430e-97e3-b27c561357d8","actor_username":"65wpn@rustyload.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-26 05:07:09.069956+00	
00000000-0000-0000-0000-000000000000	339ed94a-69b7-4a37-a2c8-521ac3df9888	{"action":"user_repeated_signup","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-26 05:07:58.149209+00	
00000000-0000-0000-0000-000000000000	85c791b4-d0e6-4b7b-b5d1-b114b7b37539	{"action":"user_confirmation_requested","actor_id":"5cec4c8b-0d19-4655-987e-884c4465ea9c","actor_username":"ishcxqjcps@wywnxa.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-26 05:08:42.711962+00	
00000000-0000-0000-0000-000000000000	bcbacbcd-770b-4bc3-a524-9477d3d128b6	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-26 05:10:52.924352+00	
00000000-0000-0000-0000-000000000000	a3f77385-d867-452c-859b-33f68ae83089	{"action":"logout","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-09-26 05:11:00.805545+00	
00000000-0000-0000-0000-000000000000	755ae396-2b04-4090-b43a-d94a796f0d34	{"action":"login","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-26 05:11:16.730487+00	
00000000-0000-0000-0000-000000000000	2c77cc39-b04a-4d4f-9a92-1494efccdf97	{"action":"login","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-26 05:11:38.028082+00	
00000000-0000-0000-0000-000000000000	6b731e67-0e62-4c39-9602-61436ffc8575	{"action":"login","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-26 05:14:24.697215+00	
00000000-0000-0000-0000-000000000000	3bfc8a69-e697-4505-ab35-c91e64f33bcd	{"action":"logout","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-09-26 05:14:48.894122+00	
00000000-0000-0000-0000-000000000000	557beaf9-809b-4a6c-a247-8f23a4f72923	{"action":"login","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-26 05:15:07.482688+00	
00000000-0000-0000-0000-000000000000	d5318ee6-1404-4b7d-8764-62ad9796a42d	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"thekusman888@gmail.com","user_id":"3f481edc-ac3e-49fe-a56e-dcd7a7661196","user_phone":""}}	2024-09-26 05:24:45.430145+00	
00000000-0000-0000-0000-000000000000	b860766d-c32e-414b-9e3b-b6bed6139c55	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"tepifeh692@nastyx.com","user_id":"d67ee3c1-dbaf-4898-9f3d-de4acf6ed1ef","user_phone":""}}	2024-09-26 05:26:30.299446+00	
00000000-0000-0000-0000-000000000000	92439745-c765-45b4-ba4a-56e6f101bfb2	{"action":"logout","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-09-26 05:30:12.169942+00	
00000000-0000-0000-0000-000000000000	c3b81dba-d0a0-4cfc-a5c6-3316d2128541	{"action":"user_confirmation_requested","actor_id":"fb0b8b96-bc75-4651-81c9-8178390ec5cb","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-26 05:38:32.414832+00	
00000000-0000-0000-0000-000000000000	1d113ce3-0f1f-45aa-b103-71fa176966b9	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"thekusman888@gmail.com","user_id":"fb0b8b96-bc75-4651-81c9-8178390ec5cb","user_phone":""}}	2024-09-26 05:42:28.636624+00	
00000000-0000-0000-0000-000000000000	ba976cf9-9037-4f60-843b-eb91b925cea6	{"action":"login","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-26 06:24:30.390891+00	
00000000-0000-0000-0000-000000000000	dba234d5-373d-4670-bdb1-399906918704	{"action":"login","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-26 06:24:32.822127+00	
00000000-0000-0000-0000-000000000000	d7c902d4-9e5a-4393-9221-c567a91fa537	{"action":"login","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-26 06:25:21.566081+00	
00000000-0000-0000-0000-000000000000	bcc1c288-c78f-40ba-9ef1-b77214e53c83	{"action":"logout","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-09-26 06:25:27.536287+00	
00000000-0000-0000-0000-000000000000	6f630f6d-e931-4fae-a873-bb827c43067b	{"action":"user_confirmation_requested","actor_id":"57bac37e-81c0-485e-9e03-8fd34975c69b","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-26 06:26:17.535899+00	
00000000-0000-0000-0000-000000000000	56ea7268-4245-434e-a5ba-b3a70a3d6704	{"action":"user_confirmation_requested","actor_id":"57bac37e-81c0-485e-9e03-8fd34975c69b","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-26 06:28:14.679117+00	
00000000-0000-0000-0000-000000000000	ffb39807-0ee0-4515-9156-493810b87a49	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"thekusman888@gmail.com","user_id":"57bac37e-81c0-485e-9e03-8fd34975c69b","user_phone":""}}	2024-09-26 06:28:43.939789+00	
00000000-0000-0000-0000-000000000000	d38a7630-6c5c-40b7-a3f1-60db83150376	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"ishcxqjcps@wywnxa.com","user_id":"5cec4c8b-0d19-4655-987e-884c4465ea9c","user_phone":""}}	2024-09-26 06:28:48.47547+00	
00000000-0000-0000-0000-000000000000	484204b3-5010-428c-8f9f-2b5a69a8310c	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"65wpn@rustyload.com","user_id":"08e3bc77-b331-430e-97e3-b27c561357d8","user_phone":""}}	2024-09-26 06:28:52.758489+00	
00000000-0000-0000-0000-000000000000	901a2f29-ed57-4b44-b561-f147595ac360	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"trason622@fintning.com","user_id":"838b1d52-d42a-40f8-97be-175f6ff7cbb9","user_phone":""}}	2024-09-26 06:29:45.186984+00	
00000000-0000-0000-0000-000000000000	347589e0-c8bd-4c85-a947-80bb3b82a2bd	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"pyxisdevlog@gmail.com","user_id":"4e3a5985-a043-44d6-a45f-6d8c8b3d724d","user_phone":""}}	2024-09-26 06:30:07.507304+00	
00000000-0000-0000-0000-000000000000	259dd859-45f6-4e4b-906a-79a84d5a4689	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-26 06:56:31.541873+00	
00000000-0000-0000-0000-000000000000	75e2fed1-8e06-4f42-8726-0a54091f439b	{"action":"token_refreshed","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-09-27 09:05:20.907747+00	
00000000-0000-0000-0000-000000000000	d53d622d-d702-4063-9551-0e0b149b5cb3	{"action":"token_revoked","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-09-27 09:05:20.915792+00	
00000000-0000-0000-0000-000000000000	46952e19-05cd-4a47-b5e5-d6e818b3c362	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"thekusman888@gmail.com","user_id":"7c62a142-cbb5-494a-83c1-dc5c36269618","user_phone":""}}	2024-09-27 09:12:12.644748+00	
00000000-0000-0000-0000-000000000000	ffc1f108-6c91-43ff-8f3b-b566352f84cd	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-27 09:19:37.733316+00	
00000000-0000-0000-0000-000000000000	e2f21e5d-91e9-4710-a594-2074b8933f78	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-27 09:50:07.600444+00	
00000000-0000-0000-0000-000000000000	ebdf8e3b-3bc4-4dfa-8248-8e8d901651fa	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-09-27 09:50:14.058269+00	
00000000-0000-0000-0000-000000000000	59885282-ef38-43f8-a08c-ef6461443376	{"action":"login","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-27 09:50:39.016637+00	
00000000-0000-0000-0000-000000000000	8fb38524-78ec-420a-90f2-56b57af65330	{"action":"token_refreshed","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-09-28 04:54:56.240431+00	
00000000-0000-0000-0000-000000000000	f4fdc235-bd08-4f94-ab3d-49f3f73cb517	{"action":"token_revoked","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-09-28 04:54:56.257849+00	
00000000-0000-0000-0000-000000000000	a7de2ccc-be22-4bc4-8f4b-71df21b1a5f7	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-28 04:55:04.644039+00	
00000000-0000-0000-0000-000000000000	0eacaf29-ef5b-4714-b454-19e59402070a	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-28 04:57:28.062664+00	
00000000-0000-0000-0000-000000000000	ae080ace-0df2-4033-b555-c436c93ffbdc	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-09-28 04:58:56.373288+00	
00000000-0000-0000-0000-000000000000	5ddc4e8b-d9fa-4e79-82cc-52aa747afd0b	{"action":"user_confirmation_requested","actor_id":"ff8b9cca-9b32-4a46-9253-acff6382fb34","actor_username":"foebmdlw6j@bltiwd.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-28 04:59:31.768996+00	
00000000-0000-0000-0000-000000000000	94f40f2e-9736-4006-8129-fc81f818955d	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-28 04:59:51.419024+00	
00000000-0000-0000-0000-000000000000	1d0a33c4-14d5-4e4e-8df7-2d07ac037760	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-09-28 05:01:06.842313+00	
00000000-0000-0000-0000-000000000000	f1e167d8-19af-4eda-822f-2c9ef7fdfe47	{"action":"user_confirmation_requested","actor_id":"1b559f9a-3402-4a0e-8d1a-0ba3b6b826d8","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-28 05:01:57.530529+00	
00000000-0000-0000-0000-000000000000	9c33d434-d752-4dc3-bf27-02a95883fe85	{"action":"user_signedup","actor_id":"1b559f9a-3402-4a0e-8d1a-0ba3b6b826d8","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-09-28 05:14:42.95175+00	
00000000-0000-0000-0000-000000000000	d9d55fac-52f9-43f5-b170-eda65d1eb963	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 06:21:43.175682+00	
00000000-0000-0000-0000-000000000000	0a94f3b5-f499-42a2-be24-b56edc1e0075	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 06:22:39.275265+00	
00000000-0000-0000-0000-000000000000	50ebab1d-b95d-4551-a4dc-83a3251ca7e2	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 06:22:51.236479+00	
00000000-0000-0000-0000-000000000000	a7e91bbe-4356-439d-a5d1-fc9b28024578	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 06:22:57.185997+00	
00000000-0000-0000-0000-000000000000	de995510-3b42-4224-80ef-a707fe6829dc	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-09-30 06:29:54.737875+00	
00000000-0000-0000-0000-000000000000	67ec3651-deca-446e-9c48-eb25cfb086c9	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"maxron084@gmail.com","user_id":"1b559f9a-3402-4a0e-8d1a-0ba3b6b826d8","user_phone":""}}	2024-09-30 06:44:16.37522+00	
00000000-0000-0000-0000-000000000000	df48890f-7dcf-42d5-9859-6e94724d9302	{"action":"user_confirmation_requested","actor_id":"bbed1e43-80d2-432a-8764-3fba7e922265","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-09-30 06:44:37.605757+00	
00000000-0000-0000-0000-000000000000	4941fbc7-5699-40ca-82ea-8ff4e510f898	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 06:45:08.268547+00	
00000000-0000-0000-0000-000000000000	6e8b82f7-8baa-4d9f-9edd-812e3bf75142	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 06:45:19.850033+00	
00000000-0000-0000-0000-000000000000	a9da44a6-d9c0-4ce7-9610-b8aa35ddf135	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 06:45:30.899199+00	
00000000-0000-0000-0000-000000000000	a1db1d9e-c95c-4706-9e4a-41b9de08a7de	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"test@gmail.com","user_id":"a5010f00-2ddd-47c8-8555-836a1e1f5bde","user_phone":""}}	2024-09-30 06:46:23.478908+00	
00000000-0000-0000-0000-000000000000	e562a355-e4d4-483e-b6aa-228f54443b8d	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"test@gmail.com","user_id":"a5010f00-2ddd-47c8-8555-836a1e1f5bde","user_phone":""}}	2024-09-30 06:48:04.984977+00	
00000000-0000-0000-0000-000000000000	14cb01ae-6059-4bd4-9fb7-afb024507e4c	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 06:51:30.613226+00	
00000000-0000-0000-0000-000000000000	f7dd92a2-dca6-452c-9501-f30eefe01409	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 11:54:37.988193+00	
00000000-0000-0000-0000-000000000000	15f0872f-34b6-4351-a2f6-6e327562244a	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 11:54:47.4787+00	
00000000-0000-0000-0000-000000000000	2e50b288-67e2-42dd-8d30-6a80eb033b43	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 11:54:59.559789+00	
00000000-0000-0000-0000-000000000000	9fd8112f-4a7f-4e26-a1c2-76548c1725ac	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 11:56:28.058478+00	
00000000-0000-0000-0000-000000000000	6af83999-85fd-451f-bd3f-1b4e178433dd	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 11:56:30.643739+00	
00000000-0000-0000-0000-000000000000	27be1c7f-f29b-4eb8-aea6-809c6fcc43ae	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 11:56:57.034373+00	
00000000-0000-0000-0000-000000000000	8d307743-bcf0-4c39-8268-5a5e9a5dc11b	{"action":"login","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 11:57:20.405158+00	
00000000-0000-0000-0000-000000000000	03d55e86-2cdb-4489-8dc7-9d4c5637bec8	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 11:57:33.556676+00	
00000000-0000-0000-0000-000000000000	06f17cf2-3322-4044-b1b3-83d2f215fe7d	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 11:57:39.592141+00	
00000000-0000-0000-0000-000000000000	84435073-104c-461c-ba49-737de0419c67	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 11:57:42.52332+00	
00000000-0000-0000-0000-000000000000	f80a2929-be55-4cb7-aff0-ab52f82ed62e	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 11:58:15.169228+00	
00000000-0000-0000-0000-000000000000	359b509a-8c29-4e9c-b933-a0a405f0af64	{"action":"token_refreshed","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-09-30 15:47:09.326551+00	
00000000-0000-0000-0000-000000000000	e499706a-de23-4667-998b-e5ae65af9021	{"action":"token_revoked","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-09-30 15:47:09.337547+00	
00000000-0000-0000-0000-000000000000	ae744f0d-5d41-420d-ac65-03309c59f5e4	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-09-30 15:55:27.608214+00	
00000000-0000-0000-0000-000000000000	49c629cf-c0af-4ddf-b84f-5e5cf221e12d	{"action":"token_refreshed","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-01 05:13:56.420742+00	
00000000-0000-0000-0000-000000000000	01bf3043-f714-4342-8715-e4af4e270bf8	{"action":"token_revoked","actor_id":"13422dbb-1432-48de-9d67-1ca677d26ec8","actor_username":"edueatssocial@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-01 05:13:56.427714+00	
00000000-0000-0000-0000-000000000000	db1690e0-1b13-446c-9320-831bd1d1271b	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 05:14:17.690445+00	
00000000-0000-0000-0000-000000000000	90df838e-56dd-478e-ba62-99d47730a328	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 05:14:28.451763+00	
00000000-0000-0000-0000-000000000000	30de4137-90e5-459c-955a-a4fc081cd327	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 05:14:37.923993+00	
00000000-0000-0000-0000-000000000000	d2bde661-6d25-44ee-972c-c6a528050041	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 05:14:57.446073+00	
00000000-0000-0000-0000-000000000000	0f403afd-2516-487f-9fd0-e4b3c4e500a5	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 05:34:16.392442+00	
00000000-0000-0000-0000-000000000000	4ace52d3-e412-499b-9809-03c7c2d19d84	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 05:34:18.948887+00	
00000000-0000-0000-0000-000000000000	3f070ca3-fb7b-4dfc-8da2-d973990ea5e1	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-01 05:34:27.0693+00	
00000000-0000-0000-0000-000000000000	67b084a6-1ecf-4de5-95b1-ed8bf1113e53	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 05:34:40.398692+00	
00000000-0000-0000-0000-000000000000	856da95c-85ef-4882-9a5d-0b14a3c3f071	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:20:37.430503+00	
00000000-0000-0000-0000-000000000000	eb84eb08-28cf-4f2c-ac56-2ad7fa0d89c9	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-01 06:20:51.738724+00	
00000000-0000-0000-0000-000000000000	458ed9e5-28c0-4473-9f9c-2c9dddad6824	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:28:28.67071+00	
00000000-0000-0000-0000-000000000000	cf5e141c-7219-42b0-91b6-1bbc215c6932	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:28:42.068242+00	
00000000-0000-0000-0000-000000000000	6f1f331f-9b8f-44f3-ace8-ad1a65a74e9f	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:29:37.5557+00	
00000000-0000-0000-0000-000000000000	b0ad715a-e59f-4b6e-9589-72d40cc648b5	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:29:43.660175+00	
00000000-0000-0000-0000-000000000000	a940c551-bac4-40ad-a8a8-6d31cae75ab7	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-01 06:29:47.087997+00	
00000000-0000-0000-0000-000000000000	e7bc0e6a-c91f-4add-bdf0-b855fe62284c	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:29:53.376424+00	
00000000-0000-0000-0000-000000000000	c153da2c-4ea0-437c-8170-8d6c49ce57f6	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:40:57.369288+00	
00000000-0000-0000-0000-000000000000	9af6c0c5-5ccb-478e-9c46-3d53066fbe22	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:45:07.558558+00	
00000000-0000-0000-0000-000000000000	29ed790c-0cfc-485e-a7d1-d520e8d088e6	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:47:21.80082+00	
00000000-0000-0000-0000-000000000000	c60f10cd-97ac-4ee5-a436-3c9c31ea2b67	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:48:20.05239+00	
00000000-0000-0000-0000-000000000000	fe9bc5a0-8a65-4c45-bfaa-629d7700bf2a	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:48:25.305967+00	
00000000-0000-0000-0000-000000000000	89bd9d25-ef20-4522-b76d-4f62bf321fce	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:48:40.766075+00	
00000000-0000-0000-0000-000000000000	8e67bc81-93c6-47e1-a6db-ef8bb9dafb3e	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 06:56:02.661346+00	
00000000-0000-0000-0000-000000000000	fdf8fd2d-c4f9-4ce7-8bfc-e6606c964430	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:01:53.83528+00	
00000000-0000-0000-0000-000000000000	68214c9a-547d-42b9-8788-e93b3b940d2a	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:06:27.386739+00	
00000000-0000-0000-0000-000000000000	1be4371d-55b0-4185-a85a-f4f72c5b5c42	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:13:47.666181+00	
00000000-0000-0000-0000-000000000000	32ad2160-b630-42b2-bdd3-115c842c4fa2	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:22:35.956208+00	
00000000-0000-0000-0000-000000000000	90c41bdb-1e42-47ec-baab-20eff8ffd939	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:22:38.214156+00	
00000000-0000-0000-0000-000000000000	5a6883d0-f8ab-4eb2-a835-3a4626ba6a45	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:22:39.376595+00	
00000000-0000-0000-0000-000000000000	63401e88-2e05-4473-bd51-5eccb2ef44eb	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:22:40.009969+00	
00000000-0000-0000-0000-000000000000	b6a5c2db-1416-425d-8a29-6ba1354289e8	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:22:40.696053+00	
00000000-0000-0000-0000-000000000000	7104a6b3-c43f-452f-80ce-48df56ba2bde	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:22:41.044246+00	
00000000-0000-0000-0000-000000000000	2af977cf-3c01-42db-a9cf-f2f2eeca18dd	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:22:41.377427+00	
00000000-0000-0000-0000-000000000000	b50353c5-c8ac-4e8b-a1c4-f69c15c5c728	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:31:45.910698+00	
00000000-0000-0000-0000-000000000000	d2fbc2b9-d79d-4f3f-bf7c-fc6f1f4a5d1a	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:31:54.270387+00	
00000000-0000-0000-0000-000000000000	3ef72d8d-0680-4467-8b20-6051f88955e7	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:32:00.690251+00	
00000000-0000-0000-0000-000000000000	98a8edea-ada4-48c6-927a-a0940124fc1f	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:33:16.460466+00	
00000000-0000-0000-0000-000000000000	5f4f436b-30d3-462e-a014-f4888f09557a	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:37:37.360921+00	
00000000-0000-0000-0000-000000000000	6017d8d6-172a-4baa-8272-3e883cdd55d5	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:42:18.848409+00	
00000000-0000-0000-0000-000000000000	80eac47b-54b9-43b2-8d3a-9843d2ebac4b	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:55:10.93268+00	
00000000-0000-0000-0000-000000000000	28a929ef-ffdf-4a1c-b00c-d51fc215a57b	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 07:57:26.022608+00	
00000000-0000-0000-0000-000000000000	f9df73f2-97e8-4ecf-8b3f-99967ee6e328	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 08:05:16.341474+00	
00000000-0000-0000-0000-000000000000	70480c40-a7ef-44b8-9f5e-d9e487f5d421	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 08:05:20.530097+00	
00000000-0000-0000-0000-000000000000	992de748-ad06-4e5d-b9df-aa49fa092d13	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 08:06:32.457425+00	
00000000-0000-0000-0000-000000000000	06b4dda6-8222-4a90-8ee4-0b54be12df91	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-01 08:08:01.330389+00	
00000000-0000-0000-0000-000000000000	117ed740-d54b-4521-9167-10f583b3c8d2	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 08:08:14.947694+00	
00000000-0000-0000-0000-000000000000	0e069267-1cc3-4fda-b550-4bc447d0e082	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-01 08:08:21.902845+00	
00000000-0000-0000-0000-000000000000	243f6aaf-2cbf-4cf0-9ac8-bbcb804d96a7	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 08:08:23.202965+00	
00000000-0000-0000-0000-000000000000	f6be0fea-555f-4a50-8a87-8594a364cf21	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 08:08:29.63279+00	
00000000-0000-0000-0000-000000000000	5de245a6-4309-45cb-a710-1515d81f2366	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 08:13:21.889507+00	
00000000-0000-0000-0000-000000000000	4412b72e-b814-4830-8b08-f5095a33fdda	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-01 08:33:47.640374+00	
00000000-0000-0000-0000-000000000000	905fc833-7959-48f2-9947-6755348943d5	{"action":"token_refreshed","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-01 10:14:00.2431+00	
00000000-0000-0000-0000-000000000000	d535b04a-438c-4928-aa54-5f8ab7335aa0	{"action":"token_revoked","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-01 10:14:00.244982+00	
00000000-0000-0000-0000-000000000000	4ec8c362-702d-4b5c-bd7a-aa4157651d83	{"action":"token_refreshed","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-01 11:12:26.639631+00	
00000000-0000-0000-0000-000000000000	be66fe28-4caf-4f8b-ad17-e5c8241aa96a	{"action":"token_revoked","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-01 11:12:26.642335+00	
00000000-0000-0000-0000-000000000000	7e26f5fa-8fcc-4cae-ac4e-6e8f487df287	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-02 06:16:09.117369+00	
00000000-0000-0000-0000-000000000000	dc509724-6598-4505-86c3-24df6456dbf6	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-02 06:29:57.290736+00	
00000000-0000-0000-0000-000000000000	39ab027b-aee3-4699-8716-9dce96d48919	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-02 06:42:39.035068+00	
00000000-0000-0000-0000-000000000000	df3d99ef-3073-4de9-8aea-dbe4d769a32b	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-02 07:14:48.86792+00	
00000000-0000-0000-0000-000000000000	48b27a03-46ad-411f-b351-6bf4182f5630	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-02 07:15:07.230057+00	
00000000-0000-0000-0000-000000000000	805becc0-447c-48cd-913a-c041af24ff59	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-02 07:15:24.086968+00	
00000000-0000-0000-0000-000000000000	ba8edbad-36b8-42e7-8485-16698d3e7972	{"action":"user_repeated_signup","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-02 07:20:11.836892+00	
00000000-0000-0000-0000-000000000000	82ebff53-58df-4cc9-bb88-2ca9b2c5ad3e	{"action":"user_confirmation_requested","actor_id":"3123c6e0-4714-42da-b5fd-8db05f4544a1","actor_username":"cutballers@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-02 07:24:22.231965+00	
00000000-0000-0000-0000-000000000000	ad6ee4a3-af24-4cc1-b2e2-4870663a08f8	{"action":"user_confirmation_requested","actor_id":"3123c6e0-4714-42da-b5fd-8db05f4544a1","actor_username":"cutballers@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-02 07:26:26.123023+00	
00000000-0000-0000-0000-000000000000	45680512-e281-4873-bdca-2d33619a7a5f	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"cutballers@gmail.com","user_id":"3123c6e0-4714-42da-b5fd-8db05f4544a1","user_phone":""}}	2024-10-02 07:34:48.284438+00	
00000000-0000-0000-0000-000000000000	801bd338-8944-4720-af84-aaafdd1c5ca1	{"action":"user_confirmation_requested","actor_id":"360bd4d6-d1d8-4080-aa33-005ea89b5cd2","actor_username":"cutballers@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-02 08:06:37.056412+00	
00000000-0000-0000-0000-000000000000	d3023590-297c-4931-a87f-a802cffcac1e	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"cutballers@gmail.com","user_id":"360bd4d6-d1d8-4080-aa33-005ea89b5cd2","user_phone":""}}	2024-10-02 08:13:42.822147+00	
00000000-0000-0000-0000-000000000000	5045ad75-08c7-4d1a-8291-e5fd4c3ccbd2	{"action":"user_confirmation_requested","actor_id":"9014e3ef-ce2c-47d9-8ce0-8c74d3ddf6f3","actor_username":"cutballers@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-02 08:13:56.253463+00	
00000000-0000-0000-0000-000000000000	2f8b119e-fe29-4b90-93b2-0262254c4b90	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"cutballers@gmail.com","user_id":"9014e3ef-ce2c-47d9-8ce0-8c74d3ddf6f3","user_phone":""}}	2024-10-02 08:21:10.21345+00	
00000000-0000-0000-0000-000000000000	a1ad6c37-b516-4ea8-9b6b-cc67d2353049	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"thekusman888@gmail.com","user_id":"7c62a142-cbb5-494a-83c1-dc5c36269618","user_phone":""}}	2024-10-02 08:29:23.330082+00	
00000000-0000-0000-0000-000000000000	0804db17-c1ee-4a33-9564-607869e98ab6	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"maxron084@gmail.com","user_id":"bbed1e43-80d2-432a-8764-3fba7e922265","user_phone":""}}	2024-10-02 08:31:05.785952+00	
00000000-0000-0000-0000-000000000000	a21b2f11-6439-4b9d-8d07-4ce1a75f4efd	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"foebmdlw6j@bltiwd.com","user_id":"ff8b9cca-9b32-4a46-9253-acff6382fb34","user_phone":""}}	2024-10-02 08:31:10.77093+00	
00000000-0000-0000-0000-000000000000	23b96810-2c8b-4199-a622-52d862a59b4e	{"action":"user_confirmation_requested","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-02 09:33:34.058759+00	
00000000-0000-0000-0000-000000000000	ab4f55bf-cf98-4ab8-90d3-a7d70e48c2f4	{"action":"user_signedup","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-10-02 09:39:36.640183+00	
00000000-0000-0000-0000-000000000000	6bb4b269-66fc-4c2f-990d-ae5a57f1abb0	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-02 09:40:20.147293+00	
00000000-0000-0000-0000-000000000000	f80a6651-95da-4168-b432-a53554c61568	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-02 09:40:54.13835+00	
00000000-0000-0000-0000-000000000000	f06070a7-ac57-4c08-8d21-5a85289bf1f5	{"action":"logout","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-02 09:42:47.513085+00	
00000000-0000-0000-0000-000000000000	a492abe8-e4a8-423e-8588-cc4ca91458e4	{"action":"user_confirmation_requested","actor_id":"018d886e-2f2b-4fae-b84f-c51d4f92caff","actor_username":"test@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-02 09:44:25.191931+00	
00000000-0000-0000-0000-000000000000	51e0ec00-404a-4b4d-b05c-9b9e6c20a346	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-02 09:51:25.101853+00	
00000000-0000-0000-0000-000000000000	ad803903-0257-457c-bcd5-efc81bff1f38	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-02 09:53:55.517975+00	
00000000-0000-0000-0000-000000000000	7fc1f34b-d993-411c-ba96-486f651aded2	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-02 09:55:06.611997+00	
00000000-0000-0000-0000-000000000000	17a1f97f-2b1c-4f4a-aed1-9d14d0ad6c09	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-02 09:55:09.000511+00	
00000000-0000-0000-0000-000000000000	ffae43f9-478e-49f5-96cd-c7d126349ed9	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-02 09:57:24.920444+00	
00000000-0000-0000-0000-000000000000	023bcb01-622c-43ae-b7d2-15ca02ebd59d	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-02 10:21:32.939781+00	
00000000-0000-0000-0000-000000000000	e333f7ae-23ae-4076-8326-06f1a4c11771	{"action":"token_refreshed","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-02 11:21:29.153643+00	
00000000-0000-0000-0000-000000000000	e3f5c136-0474-4149-8f44-3653c2a10b79	{"action":"token_revoked","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-02 11:21:29.155551+00	
00000000-0000-0000-0000-000000000000	c23d6628-fffe-469a-9ab4-0e3e1d4af283	{"action":"token_refreshed","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-03 01:07:22.126382+00	
00000000-0000-0000-0000-000000000000	944d5a5f-bced-4549-b58e-f8e98b71d283	{"action":"token_revoked","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-03 01:07:22.134708+00	
00000000-0000-0000-0000-000000000000	afdbe151-94bb-4564-826e-ea4b6b9a288a	{"action":"token_refreshed","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-19 01:28:47.64363+00	
00000000-0000-0000-0000-000000000000	4e360c95-043f-4e31-8186-4180b0f89f6b	{"action":"token_revoked","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-19 01:28:47.648526+00	
00000000-0000-0000-0000-000000000000	86678079-c3f7-47ee-bcb3-50e58bf86942	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 01:29:36.031769+00	
00000000-0000-0000-0000-000000000000	25549cfb-dbec-4ddc-9cd5-f0ed8ba3c25b	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 01:31:34.169877+00	
00000000-0000-0000-0000-000000000000	ceea248f-c7a0-4deb-b510-f723cf81471a	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-19 01:32:28.93507+00	
00000000-0000-0000-0000-000000000000	2ce4018c-77f6-400d-a4de-b7536724f9ee	{"action":"user_repeated_signup","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-19 01:33:00.287427+00	
00000000-0000-0000-0000-000000000000	ea127e95-df54-4865-9360-f986ab45d6bd	{"action":"user_confirmation_requested","actor_id":"88c764aa-d09e-4b9c-93ee-9c0901d092af","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-19 01:33:45.027725+00	
00000000-0000-0000-0000-000000000000	b1f8022e-0a87-4e1d-aac9-f54ec99e2fa8	{"action":"user_signedup","actor_id":"88c764aa-d09e-4b9c-93ee-9c0901d092af","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-10-19 01:35:12.879776+00	
00000000-0000-0000-0000-000000000000	03795e01-6f34-4f27-a389-0c2f4d34e536	{"action":"login","actor_id":"88c764aa-d09e-4b9c-93ee-9c0901d092af","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 01:35:28.24499+00	
00000000-0000-0000-0000-000000000000	1238193b-7792-4a16-9da1-c8d121fef7d1	{"action":"logout","actor_id":"88c764aa-d09e-4b9c-93ee-9c0901d092af","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-19 01:44:12.911971+00	
00000000-0000-0000-0000-000000000000	747ccf63-ee66-4934-aae2-c933e250d322	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 01:44:16.111339+00	
00000000-0000-0000-0000-000000000000	8af538e7-408f-4876-a614-11f87623d993	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-19 01:45:24.468924+00	
00000000-0000-0000-0000-000000000000	53e3f3e0-5ce0-4824-9639-675c92d8519b	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 01:47:38.14727+00	
00000000-0000-0000-0000-000000000000	720e39d2-a165-42de-baad-b0f5e88e3b9c	{"action":"logout","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-19 01:51:40.554008+00	
00000000-0000-0000-0000-000000000000	f20d68c3-a7f3-490a-8a58-f165bbc7b6d2	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 01:51:43.236474+00	
00000000-0000-0000-0000-000000000000	d3077047-c126-4d6f-b55b-08c1af4e6c10	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-19 01:52:24.165305+00	
00000000-0000-0000-0000-000000000000	beffb438-71fe-4477-b1b0-58ef0a269c04	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:14:56.039519+00	
00000000-0000-0000-0000-000000000000	5b9dbf75-2bfb-4761-a011-cd92dc047706	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:15:25.604204+00	
00000000-0000-0000-0000-000000000000	6f1a64b6-a9b6-4b21-b194-af1fe4c06708	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"maxron084@gmail.com","user_id":"88c764aa-d09e-4b9c-93ee-9c0901d092af","user_phone":""}}	2024-10-19 02:16:17.306647+00	
00000000-0000-0000-0000-000000000000	72462000-9c52-4d47-a862-76e1dae9e846	{"action":"user_confirmation_requested","actor_id":"e3b001b1-a33f-4c62-8939-443043ec0f93","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-19 02:16:34.393091+00	
00000000-0000-0000-0000-000000000000	5c94b102-514b-4d5b-a158-aa2e218e3faf	{"action":"user_signedup","actor_id":"e3b001b1-a33f-4c62-8939-443043ec0f93","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-10-19 02:17:21.736286+00	
00000000-0000-0000-0000-000000000000	e03c1e04-03ae-4ddd-ae44-c30acc7a0a09	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:17:37.758446+00	
00000000-0000-0000-0000-000000000000	6d61b356-20c8-4aab-9d24-2614bef729e1	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-19 02:19:00.575396+00	
00000000-0000-0000-0000-000000000000	a45f69d6-9ced-4ca2-b418-179ecd495cd3	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:19:02.703396+00	
00000000-0000-0000-0000-000000000000	3817e493-c0bc-4f45-be48-72fb9d9439af	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:19:12.543204+00	
00000000-0000-0000-0000-000000000000	f6ac82f6-c18a-4ad6-842b-f7ce10914e8b	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:29:46.052919+00	
00000000-0000-0000-0000-000000000000	8ca85f53-375d-4d5a-a430-e6fb1a797b21	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"maxron084@gmail.com","user_id":"e3b001b1-a33f-4c62-8939-443043ec0f93","user_phone":""}}	2024-10-19 02:37:33.044229+00	
00000000-0000-0000-0000-000000000000	bfff9961-0951-4ddd-860c-41a9abf0e974	{"action":"user_confirmation_requested","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-19 02:37:47.99559+00	
00000000-0000-0000-0000-000000000000	fea74150-9d14-49bf-92c7-73da4464deb8	{"action":"user_signedup","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-10-19 02:38:26.98261+00	
00000000-0000-0000-0000-000000000000	20a79bb0-7295-4488-ac86-7f5a26c69625	{"action":"login","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:38:41.820256+00	
00000000-0000-0000-0000-000000000000	53f3a5e6-7d48-4e9d-88b8-5b8e0d3d0b68	{"action":"login","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:38:53.707342+00	
00000000-0000-0000-0000-000000000000	3ed0a418-7c63-41ce-a050-60ae7d6e9468	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:50:12.392988+00	
00000000-0000-0000-0000-000000000000	a22424d3-68de-487a-bf98-68e2c0c81fc8	{"action":"logout","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-19 02:50:21.115499+00	
00000000-0000-0000-0000-000000000000	9296c8d5-1aff-4268-a9aa-886f8a177bde	{"action":"login","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:50:26.840814+00	
00000000-0000-0000-0000-000000000000	c8fe219f-86b4-41df-854c-1df09ee4b618	{"action":"logout","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-19 02:50:31.380413+00	
00000000-0000-0000-0000-000000000000	5565a497-f831-4029-8164-33f65768a720	{"action":"login","actor_id":"1ebd8dcf-66e4-4034-be6b-0dfc95c0114a","actor_username":"chickenarttv@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:50:46.176377+00	
00000000-0000-0000-0000-000000000000	320ffec8-d89b-4e13-9fb6-66e9c2f12e9c	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 02:50:52.572693+00	
00000000-0000-0000-0000-000000000000	c5cd3811-b40c-48c4-865e-4313c2669f00	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-19 03:48:55.598754+00	
00000000-0000-0000-0000-000000000000	54e53fe5-3d3a-413a-bc00-906e7444d2b0	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 04:39:42.206248+00	
00000000-0000-0000-0000-000000000000	9149c822-b1e4-427e-a5c7-bdb0ef7826b0	{"action":"token_refreshed","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-20 04:56:46.861424+00	
00000000-0000-0000-0000-000000000000	763e4845-3138-4585-8676-d7d1ce14bb4b	{"action":"token_revoked","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-20 04:56:46.865616+00	
00000000-0000-0000-0000-000000000000	f972f00f-e0c9-499a-a948-d0fbaf2a3e7e	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:11:08.225209+00	
00000000-0000-0000-0000-000000000000	469b26fb-5980-42de-b212-451548867677	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-20 05:13:46.54338+00	
00000000-0000-0000-0000-000000000000	2d0da18a-b4d9-4871-9ad5-c17e4ec7dd11	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:14:01.325855+00	
00000000-0000-0000-0000-000000000000	00a2162c-9705-4fc2-a89a-dfc49ce5b65f	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:20:38.326803+00	
00000000-0000-0000-0000-000000000000	4c2b5323-d649-4974-99a4-21a0849f769f	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:23:42.588047+00	
00000000-0000-0000-0000-000000000000	3ccdacd4-dac4-4de3-bc82-46096c613d84	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:25:17.263943+00	
00000000-0000-0000-0000-000000000000	e339100d-f775-4305-a8f7-d4d14faec449	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:31:37.220941+00	
00000000-0000-0000-0000-000000000000	0b3758fd-a5d9-4164-a5ac-572611951012	{"action":"logout","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-20 05:31:46.907358+00	
00000000-0000-0000-0000-000000000000	29c6ef96-e642-4c17-ba86-82ecf094b049	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:31:51.33443+00	
00000000-0000-0000-0000-000000000000	61b42460-9b4b-4a40-a922-d607f97ff6e5	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:38:39.163029+00	
00000000-0000-0000-0000-000000000000	daf8bfef-b2f9-4017-9dd3-65e3c0096bf3	{"action":"login","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:44:59.812962+00	
00000000-0000-0000-0000-000000000000	6b6f944c-0c32-48b2-90d8-d0aa1ee54d83	{"action":"login","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:45:06.126336+00	
00000000-0000-0000-0000-000000000000	b309ce08-0a67-445c-9b84-7f69fdb84f5e	{"action":"login","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:45:07.742666+00	
00000000-0000-0000-0000-000000000000	d3ce4fbd-2b57-41d8-8e76-81809bd92bfd	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:47:04.916367+00	
00000000-0000-0000-0000-000000000000	e45510de-8d7e-4c34-9253-7614468a4438	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-20 05:47:35.401043+00	
00000000-0000-0000-0000-000000000000	63380bfa-e3e8-437e-8418-d3467b1902aa	{"action":"login","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 05:55:52.450855+00	
00000000-0000-0000-0000-000000000000	9e56e08f-2a19-4388-af11-a7a4bf9b40ed	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:00:38.114066+00	
00000000-0000-0000-0000-000000000000	2ecd1bb8-e7f0-4419-8586-271ebecd6d2c	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:01:02.40881+00	
00000000-0000-0000-0000-000000000000	1aaccdc7-656e-4a91-a977-90d38fd08b55	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-20 06:01:05.64901+00	
00000000-0000-0000-0000-000000000000	96f70820-2696-4cf4-90ed-18292f0003f2	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:01:06.242263+00	
00000000-0000-0000-0000-000000000000	0856294e-dc41-4e58-8aab-7b25eb1da32b	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:01:07.214027+00	
00000000-0000-0000-0000-000000000000	4d7efb5c-3d4c-48d1-968c-1a5666aa4a1c	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-20 06:01:10.956439+00	
00000000-0000-0000-0000-000000000000	9a683de8-9b80-4921-9d5b-53bc93e2a11e	{"action":"user_confirmation_requested","actor_id":"d0b50db8-3c7a-42dc-8616-26022b6806df","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-20 06:02:51.37857+00	
00000000-0000-0000-0000-000000000000	c1f42209-1952-430f-9d23-7351fb0849e3	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:03:43.251654+00	
00000000-0000-0000-0000-000000000000	2068b206-312f-42bc-a440-92193f2ca52c	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"pyxisdevlog@gmail.com","user_id":"d0b50db8-3c7a-42dc-8616-26022b6806df","user_phone":""}}	2024-10-20 06:03:54.356696+00	
00000000-0000-0000-0000-000000000000	03cf42e4-0701-4a43-be7b-49da8c831eff	{"action":"user_confirmation_requested","actor_id":"ec5afff7-66bd-4354-a798-1f1e92d5758f","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-20 06:04:05.060176+00	
00000000-0000-0000-0000-000000000000	b909c187-a749-4c5c-ae0e-0b60faa9bb3c	{"action":"user_signedup","actor_id":"ec5afff7-66bd-4354-a798-1f1e92d5758f","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-10-20 06:04:29.924036+00	
00000000-0000-0000-0000-000000000000	587d468d-53f7-4204-b96c-7e6ea4c2d486	{"action":"login","actor_id":"ec5afff7-66bd-4354-a798-1f1e92d5758f","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:04:53.398283+00	
00000000-0000-0000-0000-000000000000	f486ce2c-ed09-49cb-a364-bb3e56cb950d	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-20 06:08:13.202255+00	
00000000-0000-0000-0000-000000000000	70963d8e-372b-4e18-b0ed-b6108b31d594	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:08:16.155375+00	
00000000-0000-0000-0000-000000000000	6f926cff-112d-48aa-a9d2-8738a26a2da2	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-20 06:08:25.447887+00	
00000000-0000-0000-0000-000000000000	c695d656-512f-4569-884f-a8f92b4c87f6	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:10:37.286878+00	
00000000-0000-0000-0000-000000000000	8dccb341-1b76-469c-a05d-33a34aa4060a	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"pyxisdevlog@gmail.com","user_id":"ec5afff7-66bd-4354-a798-1f1e92d5758f","user_phone":""}}	2024-10-20 06:11:10.123007+00	
00000000-0000-0000-0000-000000000000	d3c430f3-bb9c-4103-b1be-471e8ed9f9c6	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:14:21.25064+00	
00000000-0000-0000-0000-000000000000	274c9f4f-a1c7-491d-8a05-420e0de0799c	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:19:57.741678+00	
00000000-0000-0000-0000-000000000000	1715c7ab-1697-4d7d-917c-2eeb54ee28d8	{"action":"login","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:47:00.964917+00	
00000000-0000-0000-0000-000000000000	b4faaf82-ee1a-41a9-8754-54ee1b16d914	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 06:47:11.618896+00	
00000000-0000-0000-0000-000000000000	9abcf67a-47bd-493d-bf12-378bac2ee57a	{"action":"user_confirmation_requested","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-20 07:27:15.619452+00	
00000000-0000-0000-0000-000000000000	5fbc40d6-cd35-401f-8333-15b0a6f0025c	{"action":"user_signedup","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-10-20 07:27:33.811893+00	
00000000-0000-0000-0000-000000000000	f9016790-b710-445a-9e44-89f180a1d250	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 07:27:39.508801+00	
00000000-0000-0000-0000-000000000000	81bb08e6-1c71-4052-aa59-4dc4b956972a	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 07:37:35.986696+00	
00000000-0000-0000-0000-000000000000	1423b4d7-5f47-4125-a167-29ca983868a2	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 07:37:45.846867+00	
00000000-0000-0000-0000-000000000000	e3dbc989-8db7-4ba9-9b21-e41c75089a2c	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 07:39:47.964487+00	
00000000-0000-0000-0000-000000000000	511d5147-2603-402e-b29e-fb812f814281	{"action":"token_refreshed","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-20 08:51:17.597479+00	
00000000-0000-0000-0000-000000000000	86986720-379d-4c65-b0c3-da669eb74a13	{"action":"token_revoked","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-20 08:51:17.598416+00	
00000000-0000-0000-0000-000000000000	f41aa5cf-c47d-48ad-93a7-4a0da2d9dcff	{"action":"token_refreshed","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-20 08:53:50.999979+00	
00000000-0000-0000-0000-000000000000	8280f6e2-2d9d-4ce2-b816-85a9489d50ca	{"action":"token_revoked","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-20 08:53:51.000872+00	
00000000-0000-0000-0000-000000000000	d22e9f6b-e179-46e3-92bb-0e7a0c6afe60	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 09:15:00.61618+00	
00000000-0000-0000-0000-000000000000	26e192f2-ac86-41ce-a307-5332c9bd1370	{"action":"logout","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-20 09:26:59.243493+00	
00000000-0000-0000-0000-000000000000	7b0469b9-f14a-4d6e-bf9f-012eefb33f09	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 09:27:03.281091+00	
00000000-0000-0000-0000-000000000000	16638e0a-023a-47ab-b8eb-0b22bfa7235a	{"action":"token_refreshed","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-20 10:29:57.152305+00	
00000000-0000-0000-0000-000000000000	ef1ba586-92d8-4aeb-8b7a-1dc7092dc52b	{"action":"token_revoked","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-20 10:29:57.153896+00	
00000000-0000-0000-0000-000000000000	717e4d87-51e0-42f6-b1cc-0a22945d19fb	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 10:34:15.079301+00	
00000000-0000-0000-0000-000000000000	1d6b146d-ce43-4e94-a652-cd6529d535d3	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 10:36:05.840234+00	
00000000-0000-0000-0000-000000000000	7e682253-6b73-4b99-a55a-95023b0df1ca	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 10:36:07.691978+00	
00000000-0000-0000-0000-000000000000	b80fe7f8-bbab-4e70-8e8d-e4b1ad7c88fc	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 10:36:11.4278+00	
00000000-0000-0000-0000-000000000000	4913e3ee-c2f8-49f9-bb6e-659c14495e65	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 10:38:16.832081+00	
00000000-0000-0000-0000-000000000000	5ffd7de2-4f1a-422b-a426-0a866c1c0cb8	{"action":"user_confirmation_requested","actor_id":"a417288f-a924-4b7b-bc90-273ec002d7ae","actor_username":"richard.a.marks@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-20 10:39:47.388205+00	
00000000-0000-0000-0000-000000000000	9804bcac-0e42-4594-b3cc-063a7b7b8f75	{"action":"user_confirmation_requested","actor_id":"a417288f-a924-4b7b-bc90-273ec002d7ae","actor_username":"richard.a.marks@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2024-10-20 10:40:37.234662+00	
00000000-0000-0000-0000-000000000000	dc337a18-7d29-47f8-839e-28962a30482a	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 10:56:37.899934+00	
00000000-0000-0000-0000-000000000000	b0518077-6368-40f0-ac73-3d99d1f99cdf	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 11:03:40.718558+00	
00000000-0000-0000-0000-000000000000	38d7056c-8890-4c01-aeff-ff515a1ea476	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 11:15:34.691528+00	
00000000-0000-0000-0000-000000000000	698f750a-012f-4554-b198-29d8178a17fb	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-20 11:17:53.964827+00	
00000000-0000-0000-0000-000000000000	814c68e6-0f84-4306-8485-0627d431b1be	{"action":"user_signedup","actor_id":"a417288f-a924-4b7b-bc90-273ec002d7ae","actor_username":"richard.a.marks@gmail.com","actor_via_sso":false,"log_type":"team"}	2024-10-20 11:20:49.17289+00	
00000000-0000-0000-0000-000000000000	4b72e02b-d1b3-489b-8944-c83299098fe2	{"action":"login","actor_id":"a417288f-a924-4b7b-bc90-273ec002d7ae","actor_username":"richard.a.marks@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 11:21:02.640116+00	
00000000-0000-0000-0000-000000000000	46528028-80ce-4787-b71b-2a47a06328b1	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 11:48:23.620316+00	
00000000-0000-0000-0000-000000000000	cc2ffa92-9f67-4d56-a3f6-444d262387b5	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-20 11:54:28.980719+00	
00000000-0000-0000-0000-000000000000	c7d54f2b-d6f3-4d20-a3a6-2f802809830e	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 11:54:43.559498+00	
00000000-0000-0000-0000-000000000000	48c72361-7992-4551-8794-4d6d010057b2	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-20 11:56:02.366361+00	
00000000-0000-0000-0000-000000000000	c7830776-d4d7-49cc-aac1-279adfd31b98	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 11:56:12.883837+00	
00000000-0000-0000-0000-000000000000	f120cef4-bef0-4793-a39c-85b91be69aef	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-20 11:57:02.744559+00	
00000000-0000-0000-0000-000000000000	fbd14ddb-7494-4b31-96aa-6cf46e414aee	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 11:57:36.48177+00	
00000000-0000-0000-0000-000000000000	39d436e8-a9e6-4678-817e-043a4dd0edeb	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 11:58:31.749267+00	
00000000-0000-0000-0000-000000000000	1c53d3ca-4f87-4c54-aed5-681892eaee84	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-20 11:58:36.881108+00	
00000000-0000-0000-0000-000000000000	80bcfb45-693b-4b8e-ab2e-87bb50a0724f	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-20 11:58:50.52967+00	
00000000-0000-0000-0000-000000000000	93e731c4-57a3-4cf5-9693-e700065a8349	{"action":"login","actor_id":"a417288f-a924-4b7b-bc90-273ec002d7ae","actor_username":"richard.a.marks@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 02:14:55.569137+00	
00000000-0000-0000-0000-000000000000	8bbe92f0-733f-4307-85d3-4fc7bc6c0a61	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 08:05:46.607037+00	
00000000-0000-0000-0000-000000000000	4fdeb579-2218-490e-af96-66e899b83eb3	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 08:12:36.347752+00	
00000000-0000-0000-0000-000000000000	deaebded-957b-46cc-9fc6-b6207b56f685	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 08:12:38.663755+00	
00000000-0000-0000-0000-000000000000	4f60f317-a50a-4b9e-a025-e1429e3bc79c	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 08:12:57.677207+00	
00000000-0000-0000-0000-000000000000	26bc3fe8-dd77-435b-835a-d3afff9210ee	{"action":"token_refreshed","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-21 09:11:28.689532+00	
00000000-0000-0000-0000-000000000000	bf69d9ce-9483-4648-985b-403817fdc41d	{"action":"token_revoked","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-21 09:11:28.698364+00	
00000000-0000-0000-0000-000000000000	bca4ab97-5459-4679-8779-7e9c885e2a34	{"action":"token_refreshed","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-21 10:11:26.58794+00	
00000000-0000-0000-0000-000000000000	631cf576-a54b-4c9a-bc03-cc66994735b3	{"action":"token_revoked","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-21 10:11:26.590648+00	
00000000-0000-0000-0000-000000000000	89775533-c99e-49f3-acbc-f726b788aa18	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 10:12:14.670041+00	
00000000-0000-0000-0000-000000000000	84306811-ae7e-4de3-8358-3dc90827cb9b	{"action":"token_refreshed","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-21 10:13:29.445789+00	
00000000-0000-0000-0000-000000000000	5540a2c4-e062-4809-8a8c-0a8bd2ea8bc8	{"action":"token_revoked","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-21 10:13:29.446684+00	
00000000-0000-0000-0000-000000000000	fcce3cf5-cf4f-4096-b5b3-fff00bca0f9f	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:13:33.398555+00	
00000000-0000-0000-0000-000000000000	ae215f07-ea53-487c-a04c-a28360c39ec4	{"action":"logout","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-21 10:13:53.50379+00	
00000000-0000-0000-0000-000000000000	003367a3-bbb2-4c1a-8a20-16c11f618606	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:14:06.602154+00	
00000000-0000-0000-0000-000000000000	03c576b1-7628-42b1-88e1-03a37a450b29	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:14:57.240448+00	
00000000-0000-0000-0000-000000000000	1c527584-cfe4-4e02-a5af-679a54edbfa0	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:16:18.42615+00	
00000000-0000-0000-0000-000000000000	18ae13c9-273b-41a5-8d12-133c2cd46bb2	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:17:36.744929+00	
00000000-0000-0000-0000-000000000000	82c8f013-e1f1-4edc-80f0-2590490b724b	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 10:18:00.273375+00	
00000000-0000-0000-0000-000000000000	fda053a3-02f8-4e36-b95f-20723b5d5462	{"action":"logout","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-21 10:18:42.054514+00	
00000000-0000-0000-0000-000000000000	c93d5ee8-55e6-43d6-a7b5-3b8bd59ff515	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:18:44.860035+00	
00000000-0000-0000-0000-000000000000	0e366fca-3b7c-40d1-bd1a-7eab7848b21d	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:19:18.591786+00	
00000000-0000-0000-0000-000000000000	1eefca33-8821-48ca-8416-0be0eb952972	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:22:25.314105+00	
00000000-0000-0000-0000-000000000000	de1de0cd-3b45-4181-ab40-882c980430b7	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 10:31:39.182838+00	
00000000-0000-0000-0000-000000000000	97bbdb62-db78-44d2-93bc-6c4a628f8c6c	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:31:59.594871+00	
00000000-0000-0000-0000-000000000000	56bd2f85-b843-4af2-b07d-b264e6856d3f	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 10:32:01.994188+00	
00000000-0000-0000-0000-000000000000	56e6f415-70db-4c4c-b5bc-d00e48250671	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:37:58.4156+00	
00000000-0000-0000-0000-000000000000	60a1a4fd-d6fa-48f2-9a21-458c6722de3e	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 10:38:52.420368+00	
00000000-0000-0000-0000-000000000000	2031f5ec-7340-4a8a-af3d-c968dfc268c6	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:44:23.580311+00	
00000000-0000-0000-0000-000000000000	d8bba5d0-e56f-45d2-a5b8-ee799a6e18fd	{"action":"logout","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-21 10:44:36.59689+00	
00000000-0000-0000-0000-000000000000	732e111c-7e6e-4c1b-a903-60687a95695c	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:44:39.489152+00	
00000000-0000-0000-0000-000000000000	e3a87148-d5cc-4afd-8d22-5b942b6b7a47	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:47:40.099843+00	
00000000-0000-0000-0000-000000000000	41090d0e-7bb3-4a44-89fe-26cc2f420a0f	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:47:51.741513+00	
00000000-0000-0000-0000-000000000000	a85b9eb0-579f-45fc-8ccf-76fb0f214aba	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 10:50:13.9798+00	
00000000-0000-0000-0000-000000000000	62885e51-574e-44cd-8481-cf51750f9526	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 11:19:28.10844+00	
00000000-0000-0000-0000-000000000000	379207a1-4a73-4805-9328-8ade54522c31	{"action":"token_refreshed","actor_id":"a417288f-a924-4b7b-bc90-273ec002d7ae","actor_username":"richard.a.marks@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-21 11:22:58.028701+00	
00000000-0000-0000-0000-000000000000	d3c54a6d-b776-4b50-ad5e-85c4385f0fca	{"action":"token_revoked","actor_id":"a417288f-a924-4b7b-bc90-273ec002d7ae","actor_username":"richard.a.marks@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-21 11:22:58.030969+00	
00000000-0000-0000-0000-000000000000	28619ccd-9d9a-4631-a7d9-711b1fba95c0	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 11:26:05.605948+00	
00000000-0000-0000-0000-000000000000	fc11e175-c810-4dca-bc69-eeb9330633eb	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 11:27:43.628964+00	
00000000-0000-0000-0000-000000000000	bbbfa8a2-d01f-4065-8b5a-98b9565f067c	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 11:27:50.744838+00	
00000000-0000-0000-0000-000000000000	6f9f1433-2c4c-4243-9ca9-9900b833b45d	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 11:28:35.360463+00	
00000000-0000-0000-0000-000000000000	79a43066-8f23-4c43-86e8-670ef04515de	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 11:29:06.072465+00	
00000000-0000-0000-0000-000000000000	e2c525a5-71bb-4ede-90dc-84d31ec9c417	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 11:29:07.595485+00	
00000000-0000-0000-0000-000000000000	944af8a5-e3f4-46ec-80e1-182b8d6ef98f	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 11:29:15.403069+00	
00000000-0000-0000-0000-000000000000	3f917973-6211-430b-a205-5aae33f0db72	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 11:29:23.826962+00	
00000000-0000-0000-0000-000000000000	93af9b69-c2d9-422d-961d-85d54e024709	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 11:29:56.072846+00	
00000000-0000-0000-0000-000000000000	5e86b40d-82e2-401c-975d-8b56a6c0270e	{"action":"logout","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-21 11:34:13.31658+00	
00000000-0000-0000-0000-000000000000	76e28558-ea47-425b-b051-0b8af235a92b	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 11:34:20.873454+00	
00000000-0000-0000-0000-000000000000	72b57385-c193-43ac-812b-1a0832c64034	{"action":"login","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 11:36:47.832219+00	
00000000-0000-0000-0000-000000000000	f91cb07e-ccae-45a8-96a1-d8eff0c47621	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:09:39.646207+00	
00000000-0000-0000-0000-000000000000	b8bc6892-af4d-4746-a282-d4a24a09f1bf	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 12:16:51.188777+00	
00000000-0000-0000-0000-000000000000	3883e477-55d8-4a41-9508-3832af961546	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:20:02.828232+00	
00000000-0000-0000-0000-000000000000	4b8c13a3-0376-4c20-b2d2-bbbe5c771ba7	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:24:33.869345+00	
00000000-0000-0000-0000-000000000000	7c2c7254-f472-4d72-b5d6-349abbc33317	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:26:37.477003+00	
00000000-0000-0000-0000-000000000000	5c7d5612-a080-475f-b035-4d9a5307c7ab	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 12:27:57.066505+00	
00000000-0000-0000-0000-000000000000	563a5614-17eb-459d-9ca8-6139f7357785	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:31:07.613982+00	
00000000-0000-0000-0000-000000000000	03d40324-d6d9-4a5c-ad57-8cb025332703	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:31:55.022773+00	
00000000-0000-0000-0000-000000000000	7c7e0f76-6250-4aeb-a2e6-8c8acbb5fadd	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 12:38:52.859681+00	
00000000-0000-0000-0000-000000000000	5f3a1231-9175-4f57-8527-725fc5fbd5de	{"action":"login","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:40:09.41327+00	
00000000-0000-0000-0000-000000000000	8e6afa71-4cf2-420f-ba08-bf0252d70563	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:41:08.848904+00	
00000000-0000-0000-0000-000000000000	5fb376b1-4f96-41d4-b191-14e1c8fe30e7	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 12:42:04.798795+00	
00000000-0000-0000-0000-000000000000	2e2eddc1-f8b4-4421-8a3b-fa18f72a409c	{"action":"login","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:42:09.247842+00	
00000000-0000-0000-0000-000000000000	c8a6e996-566d-4d00-b9f8-5a180b3c716f	{"action":"logout","actor_id":"806a4418-6bf2-414c-84ee-3b43c8bf3ccf","actor_username":"maxron084@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-10-21 12:42:38.63119+00	
00000000-0000-0000-0000-000000000000	f1530c81-643d-473d-b433-1f0bd6ee32c8	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:42:43.236205+00	
00000000-0000-0000-0000-000000000000	d5970979-48ed-4491-ad63-8dd8837eff70	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:51:06.50284+00	
00000000-0000-0000-0000-000000000000	66e145a5-20ba-435f-9dc1-a70c561b4054	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 12:51:11.786668+00	
00000000-0000-0000-0000-000000000000	e8833c6a-7891-4e2f-93de-bc48e73e83eb	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:51:23.944706+00	
00000000-0000-0000-0000-000000000000	bcb2339b-9d2f-48d9-852b-413fa1aec755	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-21 12:53:26.22918+00	
00000000-0000-0000-0000-000000000000	4f01832a-1d56-4bb2-84ed-92dd241be59d	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 12:59:02.936313+00	
00000000-0000-0000-0000-000000000000	2a49aa5a-eb22-468f-84c8-73ae98e2c388	{"action":"token_refreshed","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-21 22:26:44.674322+00	
00000000-0000-0000-0000-000000000000	d194f4d4-b630-47f7-b123-a6445c768442	{"action":"token_revoked","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-21 22:26:44.676879+00	
00000000-0000-0000-0000-000000000000	cb2cf492-8fe3-43e2-aa7c-ab019ac279d9	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-21 22:29:40.401007+00	
00000000-0000-0000-0000-000000000000	6274b068-1e13-4ff0-8137-e0104e2a2df8	{"action":"token_refreshed","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-22 00:53:43.660966+00	
00000000-0000-0000-0000-000000000000	c994fe10-11cf-4eb1-afa9-aa26eb99f939	{"action":"token_revoked","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"token"}	2024-10-22 00:53:43.661833+00	
00000000-0000-0000-0000-000000000000	55630f62-d2a7-427e-932d-d5bc7f4db52a	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-22 07:05:15.206748+00	
00000000-0000-0000-0000-000000000000	39e831a0-aa6e-4889-8fef-35a0f04a9a9f	{"action":"logout","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account"}	2024-10-22 07:55:34.031709+00	
00000000-0000-0000-0000-000000000000	60876cb5-cb69-40e7-b77f-c215b12ef4d0	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-22 07:55:47.998324+00	
00000000-0000-0000-0000-000000000000	69036ed2-3370-4d3d-b19a-debd271a12d4	{"action":"token_refreshed","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-22 09:50:21.00092+00	
00000000-0000-0000-0000-000000000000	cd769880-6b34-4dc4-adc2-45fd89aea92b	{"action":"token_revoked","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-22 09:50:21.003611+00	
00000000-0000-0000-0000-000000000000	4d7f40a7-ebb3-4228-827d-40c727fe11ca	{"action":"login","actor_id":"73304dd6-064c-4c70-9aa3-079b763f2f58","actor_username":"thekusman888@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-22 09:50:27.000226+00	
00000000-0000-0000-0000-000000000000	87efcd2f-68ec-46cb-af6d-f749cfca304c	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-22 10:07:36.51279+00	
00000000-0000-0000-0000-000000000000	4c375e28-4b93-4535-9ffe-be5e7d05a5a9	{"action":"token_refreshed","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-22 10:10:30.108608+00	
00000000-0000-0000-0000-000000000000	2f1d0e52-fdf7-493e-8734-740116c02554	{"action":"token_revoked","actor_id":"30e12508-9cec-4c56-98c6-561324588730","actor_username":"pyxisdevlog@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-10-22 10:10:30.110891+00	
00000000-0000-0000-0000-000000000000	b1e7efc3-2fbd-4f7d-8efa-9bc4de01ea85	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-22 10:12:30.800023+00	
00000000-0000-0000-0000-000000000000	9ad02191-9a39-4c8c-b7ee-4ff86ce1b04e	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-22 10:13:09.89269+00	
00000000-0000-0000-0000-000000000000	838de3c6-37d4-4125-ab5a-c6b8255b1622	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-22 10:13:15.10823+00	
00000000-0000-0000-0000-000000000000	d6a8c7bd-f966-4d17-9281-7a2556fa064b	{"action":"login","actor_id":"1176502d-8513-447a-b541-e3b17e997a30","actor_username":"kusmandono.d@wcc.vic.edu.au","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-10-22 10:15:57.770233+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
1ebd8dcf-66e4-4034-be6b-0dfc95c0114a	1ebd8dcf-66e4-4034-be6b-0dfc95c0114a	{"sub": "1ebd8dcf-66e4-4034-be6b-0dfc95c0114a", "email": "chickenarttv@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-09-23 05:22:01.887839+00	2024-09-23 05:22:01.887899+00	2024-09-23 05:22:01.887899+00	fb77d069-3057-4aee-af6c-852e9660d110
1176502d-8513-447a-b541-e3b17e997a30	1176502d-8513-447a-b541-e3b17e997a30	{"sub": "1176502d-8513-447a-b541-e3b17e997a30", "role": "admin", "email": "kusmandono.d@wcc.vic.edu.au", "email_verified": false, "phone_verified": false}	email	2024-09-23 05:34:28.225472+00	2024-09-23 05:34:28.225526+00	2024-09-23 05:34:28.225526+00	cabafaa4-8380-4624-9101-7eebf4518137
13422dbb-1432-48de-9d67-1ca677d26ec8	13422dbb-1432-48de-9d67-1ca677d26ec8	{"sub": "13422dbb-1432-48de-9d67-1ca677d26ec8", "role": "admin", "email": "edueatssocial@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-09-23 06:26:44.442793+00	2024-09-23 06:26:44.442837+00	2024-09-23 06:26:44.442837+00	67f03144-45cd-4ae4-b05f-857ae64b33b9
73304dd6-064c-4c70-9aa3-079b763f2f58	73304dd6-064c-4c70-9aa3-079b763f2f58	{"sub": "73304dd6-064c-4c70-9aa3-079b763f2f58", "role": "admin", "email": "thekusman888@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-10-02 09:33:34.052885+00	2024-10-02 09:33:34.05293+00	2024-10-02 09:33:34.05293+00	a1db3591-be92-484c-ae3d-64529fdcc006
018d886e-2f2b-4fae-b84f-c51d4f92caff	018d886e-2f2b-4fae-b84f-c51d4f92caff	{"sub": "018d886e-2f2b-4fae-b84f-c51d4f92caff", "role": "admin", "email": "test@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-10-02 09:44:25.187915+00	2024-10-02 09:44:25.187963+00	2024-10-02 09:44:25.187963+00	cfee8653-1b70-4fac-9819-222250f53403
806a4418-6bf2-414c-84ee-3b43c8bf3ccf	806a4418-6bf2-414c-84ee-3b43c8bf3ccf	{"sub": "806a4418-6bf2-414c-84ee-3b43c8bf3ccf", "email": "maxron084@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-10-19 02:37:47.991492+00	2024-10-19 02:37:47.991546+00	2024-10-19 02:37:47.991546+00	e3163e22-adeb-410f-9da7-6fd0add97f4f
30e12508-9cec-4c56-98c6-561324588730	30e12508-9cec-4c56-98c6-561324588730	{"sub": "30e12508-9cec-4c56-98c6-561324588730", "role": "admin", "email": "pyxisdevlog@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-10-20 07:27:15.612692+00	2024-10-20 07:27:15.612756+00	2024-10-20 07:27:15.612756+00	67ef7d1f-ef97-4bdb-9989-87ce0f2e027a
a417288f-a924-4b7b-bc90-273ec002d7ae	a417288f-a924-4b7b-bc90-273ec002d7ae	{"sub": "a417288f-a924-4b7b-bc90-273ec002d7ae", "role": "customer", "email": "richard.a.marks@gmail.com", "email_verified": false, "phone_verified": false}	email	2024-10-20 10:39:47.382611+00	2024-10-20 10:39:47.38268+00	2024-10-20 10:39:47.38268+00	e720e622-164c-41f7-ad6a-20b2bf828f44
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
4762af27-7757-4d91-9049-a9cc0bf75329	2024-09-27 09:50:39.019294+00	2024-09-27 09:50:39.019294+00	password	1360f9fc-8db8-4d8f-9849-50d3a0323c12
de787bf3-cece-4fd7-8248-04ed39dc220e	2024-10-20 11:20:49.178823+00	2024-10-20 11:20:49.178823+00	otp	96eb6853-7e81-4757-8199-144dbbe12e43
bc2e7fe6-c5ff-40fe-80ed-484a456dc0cb	2024-10-20 11:21:02.642918+00	2024-10-20 11:21:02.642918+00	password	fd1b48e8-dc5d-48ec-8666-c2cb5429db73
332da987-e983-495b-bb4e-953780de2507	2024-09-30 11:56:57.037764+00	2024-09-30 11:56:57.037764+00	password	ff838817-20ff-4afe-8d16-f41ed9aba34f
11f67d4d-7bb8-40e0-8f4a-cf0a04c28886	2024-09-30 11:57:20.407757+00	2024-09-30 11:57:20.407757+00	password	185b60fc-f978-498f-b048-534f2ec59a48
ea927f9b-e295-46cf-add7-d916d27d129b	2024-10-21 02:14:55.607706+00	2024-10-21 02:14:55.607706+00	password	3d58d911-3508-432b-ab0c-3d6ff83e9cdb
6dbfbab6-3921-4ab2-9e80-c62e4b4e112b	2024-10-21 10:16:18.428899+00	2024-10-21 10:16:18.428899+00	password	37b81b27-678b-4452-aa62-2a6429f99158
3e9511b3-d96c-4847-b070-17ae0e5ea421	2024-10-21 10:18:44.862796+00	2024-10-21 10:18:44.862796+00	password	aced69ef-a185-4775-ab5d-a7e24b7bfadc
632c37e0-574b-4f24-bd57-e2b46b8c7ae9	2024-10-19 02:50:46.182232+00	2024-10-19 02:50:46.182232+00	password	2d47f645-ea0c-4b88-b049-0bc546d57657
1e3cba34-a5b3-4b55-8ef8-81f4cf5e1cf8	2024-10-21 10:44:39.491868+00	2024-10-21 10:44:39.491868+00	password	cca7c85c-fbb5-4683-8739-e4ccaa8c709c
13204417-aeab-48a1-a36e-34ca6bbbbed6	2024-10-21 11:19:28.118301+00	2024-10-21 11:19:28.118301+00	password	f296a1c2-270e-46be-8281-bdb8052081d0
9f87c9b4-0fbc-4cde-827a-2d2628dfc61c	2024-10-21 11:26:05.610373+00	2024-10-21 11:26:05.610373+00	password	36c38b3c-99a1-4966-b140-21521ead2263
b7c64d01-e3b2-4263-950f-b5aa427ee82f	2024-10-21 11:34:20.876001+00	2024-10-21 11:34:20.876001+00	password	a4dbcef2-bf69-481e-bc11-f163b78b846c
76e3c5b6-5c17-4c57-ac80-8afba8548792	2024-10-21 11:36:47.84037+00	2024-10-21 11:36:47.84037+00	password	4690f31b-d187-4031-bf45-ad14da1f62c0
63b7e218-7e46-42fb-a4a6-c7c10d9707f1	2024-10-22 07:55:48.003775+00	2024-10-22 07:55:48.003775+00	password	bc74b1f6-0194-49df-8a63-09a54a5046bb
7e222f58-9e28-46fc-970d-a85bf56990ac	2024-10-22 09:50:27.004868+00	2024-10-22 09:50:27.004868+00	password	3717b4a8-3401-4d6e-916f-512d746e4c4c
f243477e-039d-4636-8e61-341c7d486685	2024-10-22 10:07:36.522852+00	2024-10-22 10:07:36.522852+00	password	05ca466f-e42c-45c6-931c-328a4fbf62be
ae6db940-0641-4872-9d57-5d52711e9c28	2024-10-22 10:12:30.813886+00	2024-10-22 10:12:30.813886+00	password	5afa427e-ca99-4828-a853-1dd0c3e0eeb0
9351af05-7774-4f1f-9cf7-ffaff303fa5d	2024-10-22 10:13:09.89729+00	2024-10-22 10:13:09.89729+00	password	b101e3de-7fc7-40d1-a5db-8bae0293817e
6cce39e5-d619-4fe0-bd8c-dca5e20aa45c	2024-10-22 10:13:15.111448+00	2024-10-22 10:13:15.111448+00	password	826df3fb-c0e9-45ff-b042-35c5fdbede16
322c99df-bb48-4f69-93a9-df681af259b5	2024-10-22 10:15:57.772997+00	2024-10-22 10:15:57.772997+00	password	b1430b8b-effd-479d-a4dd-e59166d7f933
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
eb569ec4-04b0-4e0c-8939-6d1a8046053b	018d886e-2f2b-4fae-b84f-c51d4f92caff	confirmation_token	664c8634ff27e3541041d1ecd099769cefd5eb9b44262f61d5c5db19	test@gmail.com	2024-10-02 09:44:28.500655	2024-10-02 09:44:28.500655
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	59	1pKrX6j9HLf-X2zGziTnYA	1ebd8dcf-66e4-4034-be6b-0dfc95c0114a	f	2024-09-30 11:56:57.035893+00	2024-09-30 11:56:57.035893+00	\N	332da987-e983-495b-bb4e-953780de2507
00000000-0000-0000-0000-000000000000	60	H6lL3WAht7ZOz9XvfHu9Lw	13422dbb-1432-48de-9d67-1ca677d26ec8	t	2024-09-30 11:57:20.406582+00	2024-10-01 05:13:56.428237+00	\N	11f67d4d-7bb8-40e0-8f4a-cf0a04c28886
00000000-0000-0000-0000-000000000000	67	YRidhaINSe8c9g0RdkLp8Q	13422dbb-1432-48de-9d67-1ca677d26ec8	f	2024-10-01 05:13:56.431811+00	2024-10-01 05:13:56.431811+00	H6lL3WAht7ZOz9XvfHu9Lw	11f67d4d-7bb8-40e0-8f4a-cf0a04c28886
00000000-0000-0000-0000-000000000000	40	BMfC3OvIyxqGaylU2R3-PQ	13422dbb-1432-48de-9d67-1ca677d26ec8	t	2024-09-27 09:50:39.018095+00	2024-09-28 04:54:56.259021+00	\N	4762af27-7757-4d91-9049-a9cc0bf75329
00000000-0000-0000-0000-000000000000	41	GZ1reEVX5absVMejBhRBgg	13422dbb-1432-48de-9d67-1ca677d26ec8	f	2024-09-28 04:54:56.268069+00	2024-09-28 04:54:56.268069+00	BMfC3OvIyxqGaylU2R3-PQ	4762af27-7757-4d91-9049-a9cc0bf75329
00000000-0000-0000-0000-000000000000	198	_5Haqe-FEl-I0LyMinpbcQ	a417288f-a924-4b7b-bc90-273ec002d7ae	f	2024-10-20 11:20:49.177006+00	2024-10-20 11:20:49.177006+00	\N	de787bf3-cece-4fd7-8248-04ed39dc220e
00000000-0000-0000-0000-000000000000	199	HMtYCXk_soRZRGXoeLglYQ	a417288f-a924-4b7b-bc90-273ec002d7ae	f	2024-10-20 11:21:02.641702+00	2024-10-20 11:21:02.641702+00	\N	bc2e7fe6-c5ff-40fe-80ed-484a456dc0cb
00000000-0000-0000-0000-000000000000	256	haoDZ30Pu2_nX-3ol_lOYQ	73304dd6-064c-4c70-9aa3-079b763f2f58	t	2024-10-22 07:55:48.00086+00	2024-10-22 09:50:21.00578+00	\N	63b7e218-7e46-42fb-a4a6-c7c10d9707f1
00000000-0000-0000-0000-000000000000	257	XPLyO-U8m_4QeAMvSLcT2Q	73304dd6-064c-4c70-9aa3-079b763f2f58	f	2024-10-22 09:50:21.009341+00	2024-10-22 09:50:21.009341+00	haoDZ30Pu2_nX-3ol_lOYQ	63b7e218-7e46-42fb-a4a6-c7c10d9707f1
00000000-0000-0000-0000-000000000000	258	lsePWnwikFY3jxSGZjl_SQ	73304dd6-064c-4c70-9aa3-079b763f2f58	f	2024-10-22 09:50:27.002067+00	2024-10-22 09:50:27.002067+00	\N	7e222f58-9e28-46fc-970d-a85bf56990ac
00000000-0000-0000-0000-000000000000	259	2hnjVOQjFn9hMsftcap1ag	1176502d-8513-447a-b541-e3b17e997a30	f	2024-10-22 10:07:36.518693+00	2024-10-22 10:07:36.518693+00	\N	f243477e-039d-4636-8e61-341c7d486685
00000000-0000-0000-0000-000000000000	238	_N-53gg3cYCo12gh8BWZbQ	30e12508-9cec-4c56-98c6-561324588730	t	2024-10-21 11:36:47.836172+00	2024-10-22 10:10:30.111635+00	\N	76e3c5b6-5c17-4c57-ac80-8afba8548792
00000000-0000-0000-0000-000000000000	260	YehT79TeiuYBejxx2lPRrQ	30e12508-9cec-4c56-98c6-561324588730	f	2024-10-22 10:10:30.112593+00	2024-10-22 10:10:30.112593+00	_N-53gg3cYCo12gh8BWZbQ	76e3c5b6-5c17-4c57-ac80-8afba8548792
00000000-0000-0000-0000-000000000000	261	OSabCRyxFkHmLLSR7HIfbA	1176502d-8513-447a-b541-e3b17e997a30	f	2024-10-22 10:12:30.807353+00	2024-10-22 10:12:30.807353+00	\N	ae6db940-0641-4872-9d57-5d52711e9c28
00000000-0000-0000-0000-000000000000	262	g4-YHTwVlOO94dbYsoCFzg	1176502d-8513-447a-b541-e3b17e997a30	f	2024-10-22 10:13:09.89427+00	2024-10-22 10:13:09.89427+00	\N	9351af05-7774-4f1f-9cf7-ffaff303fa5d
00000000-0000-0000-0000-000000000000	149	f5Ie0iLEmo18Zp_DQfpL2Q	1ebd8dcf-66e4-4034-be6b-0dfc95c0114a	f	2024-10-19 02:50:46.179356+00	2024-10-19 02:50:46.179356+00	\N	632c37e0-574b-4f24-bd57-e2b46b8c7ae9
00000000-0000-0000-0000-000000000000	263	8lp0BWXGhXV2YzITM6y1Sg	1176502d-8513-447a-b541-e3b17e997a30	f	2024-10-22 10:13:15.109924+00	2024-10-22 10:13:15.109924+00	\N	6cce39e5-d619-4fe0-bd8c-dca5e20aa45c
00000000-0000-0000-0000-000000000000	264	BpaqzTrhbLCec7wtP8FsXA	1176502d-8513-447a-b541-e3b17e997a30	f	2024-10-22 10:15:57.771733+00	2024-10-22 10:15:57.771733+00	\N	322c99df-bb48-4f69-93a9-df681af259b5
00000000-0000-0000-0000-000000000000	217	kqF6uNl7RHN12Blbp3wCcw	73304dd6-064c-4c70-9aa3-079b763f2f58	f	2024-10-21 10:16:18.427721+00	2024-10-21 10:16:18.427721+00	\N	6dbfbab6-3921-4ab2-9e80-c62e4b4e112b
00000000-0000-0000-0000-000000000000	219	mwV04EA0G5HN1RZd7Kq2Fg	73304dd6-064c-4c70-9aa3-079b763f2f58	f	2024-10-21 10:18:44.861583+00	2024-10-21 10:18:44.861583+00	\N	3e9511b3-d96c-4847-b070-17ae0e5ea421
00000000-0000-0000-0000-000000000000	225	T6U_OPHbrJxsge6MtMl13g	73304dd6-064c-4c70-9aa3-079b763f2f58	f	2024-10-21 10:44:39.490655+00	2024-10-21 10:44:39.490655+00	\N	1e3cba34-a5b3-4b55-8ef8-81f4cf5e1cf8
00000000-0000-0000-0000-000000000000	229	R1LdoNYnGHPyIm5b7whquQ	73304dd6-064c-4c70-9aa3-079b763f2f58	f	2024-10-21 11:19:28.114626+00	2024-10-21 11:19:28.114626+00	\N	13204417-aeab-48a1-a36e-34ca6bbbbed6
00000000-0000-0000-0000-000000000000	206	mzsIPH_eY8w9p45F49y8Sg	a417288f-a924-4b7b-bc90-273ec002d7ae	t	2024-10-21 02:14:55.592504+00	2024-10-21 11:22:58.032191+00	\N	ea927f9b-e295-46cf-add7-d916d27d129b
00000000-0000-0000-0000-000000000000	230	3cqDSBv2D-6MN5US0uoe6g	a417288f-a924-4b7b-bc90-273ec002d7ae	f	2024-10-21 11:22:58.034098+00	2024-10-21 11:22:58.034098+00	mzsIPH_eY8w9p45F49y8Sg	ea927f9b-e295-46cf-add7-d916d27d129b
00000000-0000-0000-0000-000000000000	231	780s5T_9YF4PxFv5GRqZYA	73304dd6-064c-4c70-9aa3-079b763f2f58	f	2024-10-21 11:26:05.608396+00	2024-10-21 11:26:05.608396+00	\N	9f87c9b4-0fbc-4cde-827a-2d2628dfc61c
00000000-0000-0000-0000-000000000000	237	pksYbYWarDQz-ekmVHxlAQ	73304dd6-064c-4c70-9aa3-079b763f2f58	f	2024-10-21 11:34:20.87486+00	2024-10-21 11:34:20.87486+00	\N	b7c64d01-e3b2-4263-950f-b5aa427ee82f
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
4762af27-7757-4d91-9049-a9cc0bf75329	13422dbb-1432-48de-9d67-1ca677d26ec8	2024-09-27 09:50:39.017413+00	2024-09-28 04:54:56.292329+00	\N	aal1	\N	2024-09-28 04:54:56.292254	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	180.150.36.2	\N
de787bf3-cece-4fd7-8248-04ed39dc220e	a417288f-a924-4b7b-bc90-273ec002d7ae	2024-10-20 11:20:49.175864+00	2024-10-20 11:20:49.175864+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	103.137.15.45	\N
bc2e7fe6-c5ff-40fe-80ed-484a456dc0cb	a417288f-a924-4b7b-bc90-273ec002d7ae	2024-10-20 11:21:02.640967+00	2024-10-20 11:21:02.640967+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	103.137.15.45	\N
332da987-e983-495b-bb4e-953780de2507	1ebd8dcf-66e4-4034-be6b-0dfc95c0114a	2024-09-30 11:56:57.035137+00	2024-09-30 11:56:57.035137+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	180.150.36.2	\N
11f67d4d-7bb8-40e0-8f4a-cf0a04c28886	13422dbb-1432-48de-9d67-1ca677d26ec8	2024-09-30 11:57:20.405906+00	2024-10-01 05:13:56.444511+00	\N	aal1	\N	2024-10-01 05:13:56.443865	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	49.183.23.76	\N
6dbfbab6-3921-4ab2-9e80-c62e4b4e112b	73304dd6-064c-4c70-9aa3-079b763f2f58	2024-10-21 10:16:18.426934+00	2024-10-21 10:16:18.426934+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	180.150.36.2	\N
3e9511b3-d96c-4847-b070-17ae0e5ea421	73304dd6-064c-4c70-9aa3-079b763f2f58	2024-10-21 10:18:44.860837+00	2024-10-21 10:18:44.860837+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	180.150.36.2	\N
632c37e0-574b-4f24-bd57-e2b46b8c7ae9	1ebd8dcf-66e4-4034-be6b-0dfc95c0114a	2024-10-19 02:50:46.178554+00	2024-10-19 02:50:46.178554+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	180.150.36.2	\N
1e3cba34-a5b3-4b55-8ef8-81f4cf5e1cf8	73304dd6-064c-4c70-9aa3-079b763f2f58	2024-10-21 10:44:39.489889+00	2024-10-21 10:44:39.489889+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	180.150.36.2	\N
13204417-aeab-48a1-a36e-34ca6bbbbed6	73304dd6-064c-4c70-9aa3-079b763f2f58	2024-10-21 11:19:28.111672+00	2024-10-21 11:19:28.111672+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	180.150.36.2	\N
ea927f9b-e295-46cf-add7-d916d27d129b	a417288f-a924-4b7b-bc90-273ec002d7ae	2024-10-21 02:14:55.581605+00	2024-10-21 11:22:58.036756+00	\N	aal1	\N	2024-10-21 11:22:58.036685	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	103.137.15.45	\N
9f87c9b4-0fbc-4cde-827a-2d2628dfc61c	73304dd6-064c-4c70-9aa3-079b763f2f58	2024-10-21 11:26:05.607286+00	2024-10-21 11:26:05.607286+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	180.150.36.2	\N
b7c64d01-e3b2-4263-950f-b5aa427ee82f	73304dd6-064c-4c70-9aa3-079b763f2f58	2024-10-21 11:34:20.874227+00	2024-10-21 11:34:20.874227+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	180.150.36.2	\N
63b7e218-7e46-42fb-a4a6-c7c10d9707f1	73304dd6-064c-4c70-9aa3-079b763f2f58	2024-10-22 07:55:47.999284+00	2024-10-22 09:50:21.012828+00	\N	aal1	\N	2024-10-22 09:50:21.012753	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	87.121.93.253	\N
7e222f58-9e28-46fc-970d-a85bf56990ac	73304dd6-064c-4c70-9aa3-079b763f2f58	2024-10-22 09:50:27.00113+00	2024-10-22 09:50:27.00113+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36	87.121.93.253	\N
f243477e-039d-4636-8e61-341c7d486685	1176502d-8513-447a-b541-e3b17e997a30	2024-10-22 10:07:36.515419+00	2024-10-22 10:07:36.515419+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	110.174.176.9	\N
76e3c5b6-5c17-4c57-ac80-8afba8548792	30e12508-9cec-4c56-98c6-561324588730	2024-10-21 11:36:47.834129+00	2024-10-22 10:10:30.117523+00	\N	aal1	\N	2024-10-22 10:10:30.11743	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	87.121.93.253	\N
ae6db940-0641-4872-9d57-5d52711e9c28	1176502d-8513-447a-b541-e3b17e997a30	2024-10-22 10:12:30.803652+00	2024-10-22 10:12:30.803652+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	14.201.169.128	\N
9351af05-7774-4f1f-9cf7-ffaff303fa5d	1176502d-8513-447a-b541-e3b17e997a30	2024-10-22 10:13:09.893526+00	2024-10-22 10:13:09.893526+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	14.201.169.128	\N
6cce39e5-d619-4fe0-bd8c-dca5e20aa45c	1176502d-8513-447a-b541-e3b17e997a30	2024-10-22 10:13:15.109109+00	2024-10-22 10:13:15.109109+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	14.201.169.128	\N
322c99df-bb48-4f69-93a9-df681af259b5	1176502d-8513-447a-b541-e3b17e997a30	2024-10-22 10:15:57.771001+00	2024-10-22 10:15:57.771001+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	14.201.169.128	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	13422dbb-1432-48de-9d67-1ca677d26ec8	authenticated	authenticated	edueatssocial@gmail.com	$2a$10$RtIQDuiqWl9zh7/5i6mtW.Ucku8zF0.TMJKKpZRymNnDXQl6iEhvu	2024-09-23 06:30:58.816397+00	\N		2024-09-23 06:26:44.445947+00		\N			\N	2024-09-30 11:57:20.405835+00	{"provider": "email", "providers": ["email"]}	{"sub": "13422dbb-1432-48de-9d67-1ca677d26ec8", "role": "admin", "email": "edueatssocial@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-09-23 06:26:44.438728+00	2024-10-01 05:13:56.435285+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	018d886e-2f2b-4fae-b84f-c51d4f92caff	authenticated	authenticated	test@gmail.com	$2a$10$Dwc09NzDFKbTQPSu1.ZuXeqCsEHr.iP3kSF6rjaxmLvz762yFsy/6	\N	\N	664c8634ff27e3541041d1ecd099769cefd5eb9b44262f61d5c5db19	2024-10-02 09:44:25.192561+00		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{"sub": "018d886e-2f2b-4fae-b84f-c51d4f92caff", "role": "admin", "email": "test@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-10-02 09:44:25.18309+00	2024-10-02 09:44:28.498922+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	1ebd8dcf-66e4-4034-be6b-0dfc95c0114a	authenticated	authenticated	chickenarttv@gmail.com	$2a$10$9aseoCO0jkUFufQ1VWHyW.cRKt2hQ2XlNWH/jEYEOWihPizVrX6By	2024-09-23 06:02:33.772954+00	\N		2024-09-23 05:22:01.895401+00		\N			\N	2024-10-19 02:50:46.178481+00	{"provider": "email", "providers": ["email"]}	{"sub": "1ebd8dcf-66e4-4034-be6b-0dfc95c0114a", "email": "chickenarttv@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-09-23 05:22:01.877176+00	2024-10-19 02:50:46.181894+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	30e12508-9cec-4c56-98c6-561324588730	authenticated	authenticated	pyxisdevlog@gmail.com	$2a$10$1fJRQlV4vOG2F.7FZIpQce8cm4TK5vLm6/btQyAcYLEjNEL9HfAZC	2024-10-20 07:27:33.812505+00	\N		2024-10-20 07:27:15.620995+00		\N			\N	2024-10-21 11:36:47.834044+00	{"provider": "email", "providers": ["email"]}	{"sub": "30e12508-9cec-4c56-98c6-561324588730", "role": "admin", "email": "pyxisdevlog@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-10-20 07:27:15.604728+00	2024-10-22 10:10:30.114193+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	a417288f-a924-4b7b-bc90-273ec002d7ae	authenticated	authenticated	richard.a.marks@gmail.com	$2a$10$u8i2pqBOr7SmdAWsFxHZIOUWs1SpKC3w/VHkrX3/h9Hr65fPmj8Y.	2024-10-20 11:20:49.173476+00	\N		2024-10-20 10:40:37.236396+00		\N			\N	2024-10-21 02:14:55.581506+00	{"provider": "email", "providers": ["email"]}	{"sub": "a417288f-a924-4b7b-bc90-273ec002d7ae", "role": "customer", "email": "richard.a.marks@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-10-20 10:39:47.363364+00	2024-10-21 11:22:58.035361+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	806a4418-6bf2-414c-84ee-3b43c8bf3ccf	authenticated	authenticated	maxron084@gmail.com	$2a$10$XYN79IE9YMBbamytfdB6uekZByqeBMYdy/B/A5KI3m8ULfzsK8ZXi	2024-10-19 02:38:26.983256+00	\N		2024-10-19 02:37:47.996132+00		\N			\N	2024-10-21 12:42:09.248542+00	{"provider": "email", "providers": ["email"]}	{"sub": "806a4418-6bf2-414c-84ee-3b43c8bf3ccf", "email": "maxron084@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-10-19 02:37:47.967045+00	2024-10-21 12:42:09.25177+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	1176502d-8513-447a-b541-e3b17e997a30	authenticated	authenticated	kusmandono.d@wcc.vic.edu.au	$2a$10$qZzRlV5cgEmJJSX8zGVaDushImzK1KIDL80uMzgFMK1cTlroIXtGy	2024-09-23 05:35:34.643163+00	\N		2024-09-23 05:34:28.237364+00		\N			\N	2024-10-22 10:15:57.770931+00	{"provider": "email", "providers": ["email"]}	{"sub": "1176502d-8513-447a-b541-e3b17e997a30", "role": "admin", "email": "kusmandono.d@wcc.vic.edu.au", "email_verified": false, "phone_verified": false}	\N	2024-09-23 05:34:28.219569+00	2024-10-22 10:15:57.772688+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	73304dd6-064c-4c70-9aa3-079b763f2f58	authenticated	authenticated	thekusman888@gmail.com	$2a$10$RAshliyQ5TzZYncAnzcmgerVsABSXWaAElCOERQlr3OH7gJ32fXga	2024-10-02 09:39:36.643723+00	\N		2024-10-02 09:33:34.062505+00		\N			\N	2024-10-22 09:50:27.001041+00	{"provider": "email", "providers": ["email"]}	{"sub": "73304dd6-064c-4c70-9aa3-079b763f2f58", "role": "admin", "email": "thekusman888@gmail.com", "email_verified": false, "phone_verified": false}	\N	2024-10-02 09:33:34.046336+00	2024-10-22 09:50:27.004527+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (id, name, description, price, category, created_at, image_url, restaurant_id) FROM stdin;
1	Jude	Im the GOAT	40.00	GOAT SAUCE	2024-09-23 06:41:06.690356+00	\N	\N
2	chicken	this is a food	19.00	meat	2024-09-27 09:30:30.494285+00	https://xhzcnnubkhberoyzgolg.supabase.co/storage/v1/object/public/menu-images/1727429429321-VIER%20PFOTEN_2019-10-10_041-2650x1834-1920x1329.jpg	\N
3	CHicken Nuggets	This is a chicken nugget	8.00	fries	2024-10-19 03:48:12.16382+00	https://xhzcnnubkhberoyzgolg.supabase.co/storage/v1/object/public/menu-images/23/1729309690305-VIER%20PFOTEN_2019-10-10_041-2650x1834-1920x1329.jpg	23
14	friess	chill	99.00	chips	2024-10-21 10:18:38.27748+00	https://xhzcnnubkhberoyzgolg.supabase.co/storage/v1/object/public/menu-images/36/1729505916327-French-fries-b9e3e0c.jpg	36
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, menu_item_id, quantity, price) FROM stdin;
1	1	1	1	40.00
2	2	1	1	40.00
3	3	1	1	40.00
4	4	2	33	19.00
5	4	1	34	40.00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, total_price, status, created_at, restaurant_id) FROM stdin;
1	1ebd8dcf-66e4-4034-be6b-0dfc95c0114a	40.00	ready	2024-09-23 06:41:20.886826+00	\N
3	13422dbb-1432-48de-9d67-1ca677d26ec8	40.00	out_for_delivery	2024-09-26 06:24:43.193423+00	\N
2	13422dbb-1432-48de-9d67-1ca677d26ec8	40.00	delivered	2024-09-26 05:11:43.432832+00	\N
4	1176502d-8513-447a-b541-e3b17e997a30	1987.00	preparing	2024-10-02 09:54:46.063631+00	\N
8	a417288f-a924-4b7b-bc90-273ec002d7ae	8.00	pending	2024-10-20 11:21:12.355221+00	23
9	a417288f-a924-4b7b-bc90-273ec002d7ae	8.00	pending	2024-10-20 11:22:30.207242+00	23
10	a417288f-a924-4b7b-bc90-273ec002d7ae	8.00	pending	2024-10-21 02:15:31.663183+00	23
11	1176502d-8513-447a-b541-e3b17e997a30	32.00	pending	2024-10-21 08:17:16.062384+00	23
12	1176502d-8513-447a-b541-e3b17e997a30	32.00	pending	2024-10-21 08:17:19.72144+00	23
13	1176502d-8513-447a-b541-e3b17e997a30	72.00	pending	2024-10-21 10:15:33.945662+00	23
14	1176502d-8513-447a-b541-e3b17e997a30	72.00	pending	2024-10-21 10:15:37.218908+00	23
15	73304dd6-064c-4c70-9aa3-079b763f2f58	8.00	pending	2024-10-21 10:16:28.134182+00	23
16	73304dd6-064c-4c70-9aa3-079b763f2f58	99.00	pending	2024-10-21 10:19:00.905685+00	36
17	1176502d-8513-447a-b541-e3b17e997a30	107.00	pending	2024-10-21 10:20:43.443274+00	23
18	1176502d-8513-447a-b541-e3b17e997a30	2277.00	pending	2024-10-21 10:23:51.573618+00	36
19	73304dd6-064c-4c70-9aa3-079b763f2f58	99.00	pending	2024-10-21 10:44:51.623267+00	36
22	1176502d-8513-447a-b541-e3b17e997a30	693.00	out_for_delivery	2024-10-21 11:31:36.718223+00	36
21	73304dd6-064c-4c70-9aa3-079b763f2f58	99.00	delivered	2024-10-21 11:26:27.628296+00	36
20	73304dd6-064c-4c70-9aa3-079b763f2f58	99.00	pending	2024-10-21 11:19:46.015503+00	36
23	806a4418-6bf2-414c-84ee-3b43c8bf3ccf	198.00	pending	2024-10-21 12:40:20.37349+00	36
24	806a4418-6bf2-414c-84ee-3b43c8bf3ccf	396.00	pending	2024-10-21 12:40:37.356104+00	36
25	1176502d-8513-447a-b541-e3b17e997a30	99.00	pending	2024-10-22 07:52:35.99229+00	36
26	1176502d-8513-447a-b541-e3b17e997a30	99.00	pending	2024-10-22 07:52:51.499046+00	36
27	73304dd6-064c-4c70-9aa3-079b763f2f58	198.00	pending	2024-10-22 07:55:51.520896+00	36
28	73304dd6-064c-4c70-9aa3-079b763f2f58	99.00	pending	2024-10-22 09:50:34.106368+00	36
29	73304dd6-064c-4c70-9aa3-079b763f2f58	99.00	pending	2024-10-22 09:52:16.231672+00	36
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, role, created_at, restaurant_id) FROM stdin;
018d886e-2f2b-4fae-b84f-c51d4f92caff	admin	2024-10-02 09:44:25.182716+00	\N
1176502d-8513-447a-b541-e3b17e997a30	admin	2024-09-26 06:56:23.741682+00	\N
73304dd6-064c-4c70-9aa3-079b763f2f58	customer	2024-10-02 09:33:34.045968+00	\N
806a4418-6bf2-414c-84ee-3b43c8bf3ccf	customer	2024-10-19 02:37:47.966702+00	\N
30e12508-9cec-4c56-98c6-561324588730	admin	2024-10-20 07:27:15.60439+00	\N
a417288f-a924-4b7b-bc90-273ec002d7ae	customer	2024-10-20 10:39:47.363015+00	\N
\.


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurants (id, name, description, admin_id, created_at) FROM stdin;
23	My Restaurant	Restaurant description	1176502d-8513-447a-b541-e3b17e997a30	2024-10-19 03:47:46.48044+00
36	McDonalds	A fast food chain. An EduEats certified restaurant member.	30e12508-9cec-4c56-98c6-561324588730	2024-10-20 07:27:19.26984+00
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: realtime; Owner: supabase_realtime_admin
--

COPY realtime.messages (id, topic, extension, inserted_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2024-09-20 23:52:29
20211116045059	2024-09-20 23:52:29
20211116050929	2024-09-20 23:52:29
20211116051442	2024-09-20 23:52:29
20211116212300	2024-09-20 23:52:29
20211116213355	2024-09-20 23:52:29
20211116213934	2024-09-20 23:52:29
20211116214523	2024-09-20 23:52:29
20211122062447	2024-09-20 23:52:29
20211124070109	2024-09-20 23:52:29
20211202204204	2024-09-20 23:52:29
20211202204605	2024-09-20 23:52:29
20211210212804	2024-09-20 23:52:29
20211228014915	2024-09-20 23:52:29
20220107221237	2024-09-20 23:52:29
20220228202821	2024-09-20 23:52:29
20220312004840	2024-09-20 23:52:29
20220603231003	2024-09-20 23:52:29
20220603232444	2024-09-20 23:52:29
20220615214548	2024-09-20 23:52:29
20220712093339	2024-09-20 23:52:29
20220908172859	2024-09-20 23:52:29
20220916233421	2024-09-20 23:52:29
20230119133233	2024-09-20 23:52:29
20230128025114	2024-09-20 23:52:29
20230128025212	2024-09-20 23:52:29
20230227211149	2024-09-20 23:52:29
20230228184745	2024-09-20 23:52:29
20230308225145	2024-09-20 23:52:29
20230328144023	2024-09-20 23:52:29
20231018144023	2024-09-20 23:52:29
20231204144023	2024-09-20 23:52:29
20231204144024	2024-09-20 23:52:29
20231204144025	2024-09-20 23:52:29
20240108234812	2024-09-20 23:52:29
20240109165339	2024-09-20 23:52:29
20240227174441	2024-09-20 23:52:30
20240311171622	2024-09-20 23:52:30
20240321100241	2024-09-20 23:52:30
20240401105812	2024-09-20 23:52:30
20240418121054	2024-09-20 23:52:30
20240523004032	2024-09-20 23:52:30
20240618124746	2024-09-20 23:52:30
20240801235015	2024-09-20 23:52:30
20240805133720	2024-09-20 23:52:30
20240827160934	2024-09-20 23:52:30
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
menu-images	menu-images	\N	2024-09-27 09:18:51.027085+00	2024-09-27 09:18:51.027085+00	t	f	\N	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2024-09-20 23:45:50.56827
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2024-09-20 23:45:50.637389
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2024-09-20 23:45:50.686254
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2024-09-20 23:45:50.767422
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2024-09-20 23:45:50.847308
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2024-09-20 23:45:50.89909
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2024-09-20 23:45:50.950424
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2024-09-20 23:45:51.002302
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2024-09-20 23:45:51.054044
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2024-09-20 23:45:51.102155
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2024-09-20 23:45:51.154418
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2024-09-20 23:45:51.206087
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2024-09-20 23:45:51.26311
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2024-09-20 23:45:51.314687
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2024-09-20 23:45:51.366471
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2024-09-20 23:45:51.442848
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2024-09-20 23:45:51.498338
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2024-09-20 23:45:51.55015
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2024-09-20 23:45:51.602184
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2024-09-20 23:45:51.611616
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2024-09-20 23:45:51.66242
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2024-09-20 23:45:51.722375
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2024-09-20 23:45:51.798848
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2024-09-20 23:45:51.872553
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2024-09-20 23:45:51.927907
25	custom-metadata	67eb93b7e8d401cafcdc97f9ac779e71a79bfe03	2024-09-20 23:45:51.977858
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata) FROM stdin;
23fa87ce-6254-470f-a13b-74599b6533ef	menu-images	1727429115672-rooster-Rhode-Island-Red-roosters-chicken-domestication.webp	1176502d-8513-447a-b541-e3b17e997a30	2024-09-27 09:25:16.431731+00	2024-09-27 09:25:16.431731+00	2024-09-27 09:25:16.431731+00	{"eTag": "\\"5bfa6e6abed755dee69e246dc895521a\\"", "size": 319668, "mimetype": "image/webp", "cacheControl": "max-age=3600", "lastModified": "2024-09-27T09:25:17.000Z", "contentLength": 319668, "httpStatusCode": 200}	ad24c4fb-c97b-45da-a93c-2d04ddcda21d	1176502d-8513-447a-b541-e3b17e997a30	{}
9fefd081-19ca-4ee1-aa3b-324c4628f8a7	menu-images	1727429149343-VIER PFOTEN_2019-10-10_041-2650x1834-1920x1329.jpg	1176502d-8513-447a-b541-e3b17e997a30	2024-09-27 09:25:50.102997+00	2024-09-27 09:25:50.102997+00	2024-09-27 09:25:50.102997+00	{"eTag": "\\"610fa75dc2491363b6339b430ffd91cb\\"", "size": 471337, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-09-27T09:25:51.000Z", "contentLength": 471337, "httpStatusCode": 200}	98bfa43e-6952-4856-8091-363c878b51e2	1176502d-8513-447a-b541-e3b17e997a30	{}
ca9301cb-4d4d-4bbc-8d3e-326cb89b0374	menu-images	1727429154992-VIER PFOTEN_2019-10-10_041-2650x1834-1920x1329.jpg	1176502d-8513-447a-b541-e3b17e997a30	2024-09-27 09:25:55.188358+00	2024-09-27 09:25:55.188358+00	2024-09-27 09:25:55.188358+00	{"eTag": "\\"610fa75dc2491363b6339b430ffd91cb\\"", "size": 471337, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-09-27T09:25:56.000Z", "contentLength": 471337, "httpStatusCode": 200}	8438caa0-3116-4782-a76f-2ffb84a711b0	1176502d-8513-447a-b541-e3b17e997a30	{}
89eb4509-0e71-4bfd-9633-f4c29e8cfdf3	menu-images	1727429160888-VIER PFOTEN_2019-10-10_041-2650x1834-1920x1329.jpg	1176502d-8513-447a-b541-e3b17e997a30	2024-09-27 09:26:01.288126+00	2024-09-27 09:26:01.288126+00	2024-09-27 09:26:01.288126+00	{"eTag": "\\"610fa75dc2491363b6339b430ffd91cb\\"", "size": 471337, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-09-27T09:26:02.000Z", "contentLength": 471337, "httpStatusCode": 200}	61323623-5f2f-47c0-a92b-4edfc5c48658	1176502d-8513-447a-b541-e3b17e997a30	{}
dff5c848-c09a-4a17-b3d7-d280c3a50d83	menu-images	1727429172183-VIER PFOTEN_2019-10-10_041-2650x1834-1920x1329.jpg	1176502d-8513-447a-b541-e3b17e997a30	2024-09-27 09:26:12.270956+00	2024-09-27 09:26:12.270956+00	2024-09-27 09:26:12.270956+00	{"eTag": "\\"610fa75dc2491363b6339b430ffd91cb\\"", "size": 471337, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-09-27T09:26:13.000Z", "contentLength": 471337, "httpStatusCode": 200}	7e2a4e3b-0360-410f-9713-eade1ff7048e	1176502d-8513-447a-b541-e3b17e997a30	{}
e99f2501-a90a-4164-809b-9d6e9dd11ca9	menu-images	1727429429321-VIER PFOTEN_2019-10-10_041-2650x1834-1920x1329.jpg	1176502d-8513-447a-b541-e3b17e997a30	2024-09-27 09:30:29.973844+00	2024-09-27 09:30:29.973844+00	2024-09-27 09:30:29.973844+00	{"eTag": "\\"610fa75dc2491363b6339b430ffd91cb\\"", "size": 471337, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-09-27T09:30:30.000Z", "contentLength": 471337, "httpStatusCode": 200}	aac50b8a-e8bb-4e57-ab8e-81f15e66beda	1176502d-8513-447a-b541-e3b17e997a30	{}
0c8692d2-9a4c-4b4a-8a81-50326604b693	menu-images	23/1729309690305-VIER PFOTEN_2019-10-10_041-2650x1834-1920x1329.jpg	1176502d-8513-447a-b541-e3b17e997a30	2024-10-19 03:48:11.584015+00	2024-10-19 03:48:11.584015+00	2024-10-19 03:48:11.584015+00	{"eTag": "\\"610fa75dc2491363b6339b430ffd91cb\\"", "size": 471337, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-10-19T03:48:12.000Z", "contentLength": 471337, "httpStatusCode": 200}	1abcb9a0-e218-47fa-afce-bd8eb56c1aaf	1176502d-8513-447a-b541-e3b17e997a30	{}
7ed46f52-72c4-4e8a-87bd-3e9d665e4e14	menu-images	36/1729505916327-French-fries-b9e3e0c.jpg	30e12508-9cec-4c56-98c6-561324588730	2024-10-21 10:18:37.720477+00	2024-10-21 10:18:37.720477+00	2024-10-21 10:18:37.720477+00	{"eTag": "\\"be172d754ce4b5f090349783a69bb4f5\\"", "size": 182207, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2024-10-21T10:18:38.000Z", "contentLength": 182207, "httpStatusCode": 200}	95ea8136-ded8-4c9b-a598-f62576572533	30e12508-9cec-4c56-98c6-561324588730	{}
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 264, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_id_seq', 14, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 34, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 29, true);


--
-- Name: restaurants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurants_id_seq', 36, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_realtime_admin
--

SELECT pg_catalog.setval('realtime.messages_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);


--
-- Name: messages_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_topic_index ON realtime.messages USING btree (topic);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: users on_auth_user_created; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: menu_items menu_items_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);


--
-- Name: order_items order_items_menu_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_menu_item_id_fkey FOREIGN KEY (menu_item_id) REFERENCES public.menu_items(id);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders orders_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id);


--
-- Name: profiles profiles_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(id);


--
-- Name: restaurants restaurants_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES auth.users(id);


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: menu_items Admins can delete their restaurant's menu items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can delete their restaurant's menu items" ON public.menu_items FOR DELETE USING ((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE (restaurants.id = menu_items.restaurant_id))));


--
-- Name: restaurants Admins can insert and update restaurants; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert and update restaurants" ON public.restaurants USING ((auth.uid() IN ( SELECT profiles.id
   FROM public.profiles
  WHERE (profiles.role = 'admin'::text))));


--
-- Name: menu_items Admins can insert menu items for their restaurant; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert menu items for their restaurant" ON public.menu_items FOR INSERT WITH CHECK ((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE (restaurants.id = menu_items.restaurant_id))));


--
-- Name: restaurants Admins can insert restaurants; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can insert restaurants" ON public.restaurants FOR INSERT WITH CHECK ((auth.uid() IN ( SELECT profiles.id
   FROM public.profiles
  WHERE (profiles.role = 'admin'::text))));


--
-- Name: orders Admins can update orders for their restaurant; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update orders for their restaurant" ON public.orders FOR UPDATE USING ((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE (restaurants.id = orders.restaurant_id))));


--
-- Name: restaurants Admins can update their own restaurant; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update their own restaurant" ON public.restaurants FOR UPDATE USING ((auth.uid() = admin_id));


--
-- Name: menu_items Admins can update their restaurant's menu items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can update their restaurant's menu items" ON public.menu_items FOR UPDATE USING ((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE (restaurants.id = menu_items.restaurant_id))));


--
-- Name: order_items Admins can view order items for their restaurant; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can view order items for their restaurant" ON public.order_items FOR SELECT USING ((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE (restaurants.id = ( SELECT orders.restaurant_id
           FROM public.orders
          WHERE (orders.id = order_items.order_id))))));


--
-- Name: orders Admins can view orders for their restaurant; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can view orders for their restaurant" ON public.orders FOR SELECT USING ((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE (restaurants.id = orders.restaurant_id))));


--
-- Name: restaurants Admins can view their own restaurant; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can view their own restaurant" ON public.restaurants FOR SELECT USING ((auth.uid() = admin_id));


--
-- Name: menu_items Admins can view their restaurant's menu items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Admins can view their restaurant's menu items" ON public.menu_items FOR SELECT USING ((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE (restaurants.id = menu_items.restaurant_id))));


--
-- Name: menu_items Allow admin access to menu items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow admin access to menu items" ON public.menu_items USING ((auth.uid() IN ( SELECT profiles.id
   FROM public.profiles
  WHERE (profiles.role = 'admin'::text))));


--
-- Name: profiles Allow insert for new users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow insert for new users" ON public.profiles FOR INSERT WITH CHECK (true);


--
-- Name: menu_items Allow public read access to menu items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow public read access to menu items" ON public.menu_items FOR SELECT USING (true);


--
-- Name: profiles Allow public read access to profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow public read access to profiles" ON public.profiles FOR SELECT USING (true);


--
-- Name: menu_items Allow restaurant admin access to menu items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Allow restaurant admin access to menu items" ON public.menu_items USING ((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE (restaurants.id = menu_items.restaurant_id))));


--
-- Name: profiles Authenticated users can view all profiles; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Authenticated users can view all profiles" ON public.profiles FOR SELECT USING ((auth.role() = 'authenticated'::text));


--
-- Name: menu_items Public read access to menu items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public read access to menu items" ON public.menu_items FOR SELECT USING (true);


--
-- Name: restaurants Public read access to restaurants; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Public read access to restaurants" ON public.restaurants FOR SELECT USING (true);


--
-- Name: menu_items Restaurant admins can manage menu items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Restaurant admins can manage menu items" ON public.menu_items USING ((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE (restaurants.id = menu_items.restaurant_id))));


--
-- Name: restaurants Restaurant admins can update their own restaurant; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Restaurant admins can update their own restaurant" ON public.restaurants FOR UPDATE USING ((auth.uid() = admin_id));


--
-- Name: orders Restaurant admins can view and update orders for their restaura; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Restaurant admins can view and update orders for their restaura" ON public.orders USING ((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE (restaurants.id = orders.restaurant_id))));


--
-- Name: restaurants Restaurant admins can view and update their own restaurant; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Restaurant admins can view and update their own restaurant" ON public.restaurants USING ((auth.uid() = admin_id));


--
-- Name: order_items Restaurant admins can view order items for their restaurant; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Restaurant admins can view order items for their restaurant" ON public.order_items FOR SELECT USING ((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE (restaurants.id IN ( SELECT orders.restaurant_id
           FROM public.orders
          WHERE (orders.id = order_items.order_id))))));


--
-- Name: orders Users can insert their own orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can insert their own orders" ON public.orders FOR INSERT WITH CHECK ((auth.uid() = user_id));


--
-- Name: profiles Users can update their own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can update their own profile" ON public.profiles FOR UPDATE USING ((auth.uid() = id));


--
-- Name: profiles Users can view and update their own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view and update their own profile" ON public.profiles USING ((auth.uid() = id));


--
-- Name: order_items Users can view their own order items; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own order items" ON public.order_items FOR SELECT USING ((auth.uid() IN ( SELECT orders.user_id
   FROM public.orders
  WHERE (orders.id = order_items.order_id))));


--
-- Name: orders Users can view their own orders; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own orders" ON public.orders FOR SELECT USING ((auth.uid() = user_id));


--
-- Name: profiles Users can view their own profile; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Users can view their own profile" ON public.profiles FOR SELECT USING ((auth.uid() = id));


--
-- Name: menu_items; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.menu_items ENABLE ROW LEVEL SECURITY;

--
-- Name: order_items; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.order_items ENABLE ROW LEVEL SECURITY;

--
-- Name: orders; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: restaurants; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.restaurants ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects Allow admin access to menu images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow admin access to menu images" ON storage.objects USING (((auth.uid() IN ( SELECT profiles.id
   FROM public.profiles
  WHERE (profiles.role = 'admin'::text))) AND (bucket_id = 'menu-images'::text)));


--
-- Name: objects Allow public read access to menu images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow public read access to menu images" ON storage.objects FOR SELECT USING ((bucket_id = 'menu-images'::text));


--
-- Name: objects Allow restaurant admin access to menu images; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Allow restaurant admin access to menu images" ON storage.objects USING (((auth.uid() IN ( SELECT restaurants.admin_id
   FROM public.restaurants
  WHERE ((restaurants.id)::text = (storage.foldername(restaurants.name))[1]))) AND (bucket_id = 'menu-images'::text)));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;
GRANT ALL ON FUNCTION auth.email() TO postgres;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;
GRANT ALL ON FUNCTION auth.role() TO postgres;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;
GRANT ALL ON FUNCTION auth.uid() TO postgres;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION create_restaurant_for_admin(admin_id uuid, restaurant_name text, restaurant_description text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.create_restaurant_for_admin(admin_id uuid, restaurant_name text, restaurant_description text) TO anon;
GRANT ALL ON FUNCTION public.create_restaurant_for_admin(admin_id uuid, restaurant_name text, restaurant_description text) TO authenticated;
GRANT ALL ON FUNCTION public.create_restaurant_for_admin(admin_id uuid, restaurant_name text, restaurant_description text) TO service_role;


--
-- Name: FUNCTION create_user_profile_and_restaurant(user_id uuid, user_role text, rest_name text, rest_description text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.create_user_profile_and_restaurant(user_id uuid, user_role text, rest_name text, rest_description text) TO anon;
GRANT ALL ON FUNCTION public.create_user_profile_and_restaurant(user_id uuid, user_role text, rest_name text, rest_description text) TO authenticated;
GRANT ALL ON FUNCTION public.create_user_profile_and_restaurant(user_id uuid, user_role text, rest_name text, rest_description text) TO service_role;


--
-- Name: FUNCTION handle_new_user(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;


--
-- Name: FUNCTION register_admin_and_create_restaurant(admin_id uuid, rest_name text, rest_description text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.register_admin_and_create_restaurant(admin_id uuid, rest_name text, rest_description text) TO anon;
GRANT ALL ON FUNCTION public.register_admin_and_create_restaurant(admin_id uuid, rest_name text, rest_description text) TO authenticated;
GRANT ALL ON FUNCTION public.register_admin_and_create_restaurant(admin_id uuid, rest_name text, rest_description text) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION can_insert_object(bucketid text, name text, owner uuid, metadata jsonb); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) TO postgres;


--
-- Name: FUNCTION extension(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.extension(name text) TO postgres;


--
-- Name: FUNCTION filename(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.filename(name text) TO postgres;


--
-- Name: FUNCTION foldername(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.foldername(name text) TO postgres;


--
-- Name: FUNCTION get_size_by_bucket(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.get_size_by_bucket() TO postgres;


--
-- Name: FUNCTION list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) TO postgres;


--
-- Name: FUNCTION list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) TO postgres;


--
-- Name: FUNCTION operation(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.operation() TO postgres;


--
-- Name: FUNCTION search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) TO postgres;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.update_updated_at_column() TO postgres;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE menu_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.menu_items TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.menu_items TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.menu_items TO service_role;


--
-- Name: SEQUENCE menu_items_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.menu_items_id_seq TO anon;
GRANT ALL ON SEQUENCE public.menu_items_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.menu_items_id_seq TO service_role;


--
-- Name: TABLE order_items; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.order_items TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.order_items TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.order_items TO service_role;


--
-- Name: SEQUENCE order_items_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.order_items_id_seq TO anon;
GRANT ALL ON SEQUENCE public.order_items_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.order_items_id_seq TO service_role;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.orders TO service_role;


--
-- Name: SEQUENCE orders_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.orders_id_seq TO anon;
GRANT ALL ON SEQUENCE public.orders_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.orders_id_seq TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.profiles TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.profiles TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.profiles TO service_role;


--
-- Name: TABLE restaurants; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.restaurants TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.restaurants TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE public.restaurants TO service_role;


--
-- Name: SEQUENCE restaurants_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.restaurants_id_seq TO anon;
GRANT ALL ON SEQUENCE public.restaurants_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.restaurants_id_seq TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.messages TO postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: SEQUENCE messages_id_seq; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON SEQUENCE realtime.messages_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.messages_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.messages_id_seq TO service_role;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.schema_migrations TO postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.subscription TO postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO authenticated;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO service_role;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.s3_multipart_uploads TO postgres;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE storage.s3_multipart_uploads_parts TO postgres;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

