
int main(int argc, char *argv[])
{
    unsigned int x;
    unsigned int i;
    char c1[10] = "";

    x = 100; //snprintf(c1, 10, "%s", argv[1]);

    for (i = 0; i < x; i++) {
        memset(c1, 0, i);
        func(c1, 0, i);
    }

    return 0;
}

void func(char *d, int b, unsigned int len)
{
    memset(d, b, len);
}
