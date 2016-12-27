module PostgresqlUserScript
  def user_creation_plsql(username, password)
    <<-SCRIPT_SQL
      DO
        \\\\$\\\\$
        BEGIN
          IF NOT EXISTS (
            SELECT * FROM pg_catalog.pg_user WHERE usename = '#{username}'
          )
          THEN CREATE USER #{username} WITH CREATEDB LOGIN PASSWORD '#{password}';
          END IF;
        END
        \\\\$\\\\$
      ;
    SCRIPT_SQL
  end

  def create_postgres_user(username, password)
    <<-SCRIPT
      echo '===== Creating PostgreSQL databases and users'
      su postgres -c "psql -c \\"#{user_creation_plsql(username, password)}\\""
    SCRIPT
  end
end
