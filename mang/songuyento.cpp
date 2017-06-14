#include<stdio.h>
main()
{
	int a[10],i,j;
	for(i=0;i<5;i++)
	{
		printf("Nhap so thu %d:",i+1);
		scanf("%d",&a[i]);
	}
	
	int dem=0;
	for(i=0;i<5;i++)
	{
		for(j=2;j<=a[i];j++)
		{
			if(a[i]%j==0)
			dem=dem+1;
		}
		if(dem==0)
		printf("%d la so ngto \n",a[i]);
		dem=0;
	}

	
}