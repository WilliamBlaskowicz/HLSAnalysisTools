#define N 16

int r0()
{
    return 0;
}

void addArr(int *a,int *b)
{
/*L1:*//*L1:*//*L1:*//*L1:*/    for(int i=0;i<N;i++)
        a[i] += b[i];
}

int top_level_function(int argc,char **argv)
{
/*L2:*//*L2:*//*L2:*//*L2:*/    int A[N] = {9,8,7,6,5,4,3,2,1,0,16,17,18,19,20,15};
/*L3:*//*L3:*//*L3:*//*L3:*/    int B[N][N];
    int temp;
/*L4:*//*L4:*//*L4:*//*L4:*/    for (int i=0;i<N-1;i++)
/*L5:*//*L5:*//*L5:*//*L5:*/        for (int j=0;j<N-i-1;j++)
        {
            if (A[j] > A[j + 1])
            {
                temp = A[j+1];
                A[j+1]=A[j]+1;
                A[j]=temp;
            }
        }
    addArr(A,A);
/*L6:*//*L6:*//*L6:*//*L6:*/    for (int i=1;i<N;i++)
        A[i] = A[i] + 1;
/*L7:*//*L7:*//*L7:*//*L7:*/    for (int i=0;i<N;i++)
/*L8:*//*L8:*//*L8:*//*L8:*/        for (int j=0;j<N;j++)
            B[i][j] += i*j;
    return A[0];
}