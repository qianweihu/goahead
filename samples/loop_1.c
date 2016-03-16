
void func(char *d, int b, unsigned int len)
{
    memset(d, b, len);
}

int main(int argc, char *argv[])
{
    unsigned int x;
    unsigned int i;
    char c1[10] = "";
    char c2[100] = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";

    x = 100; //snprintf(c1, 10, "%s", argv[1]);
    y = snprintf(c1, 10, "%s", c2);

    for (i = 0; i < x; i++) {
        memset(c1, 0, i);
        func(c1, 0, i);
    }

    for (i = 0; i < y; i++) {
        memset(c1, 0, i);
    }

    for (i = 0; i < y; i++) {
        func(c1, 0, i);
    }

    return 0;
}
