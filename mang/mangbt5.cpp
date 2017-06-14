#include<stdio.h>
main()
{
	int a[5],i,dem;
	dem=0;
	for(i=0;i<5;i++)
	{
		printf("Nhap phan tu thu %d:",i+1);
		scanf("%d",&a[i]);
		if(a[i]<0)
		dem=dem+1;
	}
	printf("Co %d phan tu nho hon 0",dem);
	
}