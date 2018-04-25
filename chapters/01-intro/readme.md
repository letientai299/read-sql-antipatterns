Instead of copy paste the code from the book, or from downloaded zip file. I've
typed all by myself to get more time understanding the schema and be more
comfortable with SQL. (I've write many SQL, but most of them are just throwaway
code. And feeling writing them is not the same when writing java.)

I've also make a lot of modification to make this work with both postgres and
mysql:

- Replace `BLOB` with `TEXT`, as `BLOB` is not portable. I've also replace `*_image`
with `*_image_url` to indicate that the image should be stored else where, not
within the database.

- Remove `UNSIGNED` as that's not portable also.

- Replace `DATETIME` with `DATE`

- Replace `SERIAL` with `BIGINT` when declare `PRIMARY KEY`, as MySQL fail to
  reference mismatched foreign key (declared as `BIGINT`) and primary
  (`SERIAL`).
