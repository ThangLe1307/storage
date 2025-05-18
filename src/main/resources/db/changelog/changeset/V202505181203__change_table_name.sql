
do
$$
    begin
        alter table users rename to "user";
        alter table nodes rename to node;
        alter table files rename to file;
    end;
$$