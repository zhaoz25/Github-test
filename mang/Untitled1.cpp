#include<stdio.h>
main()
{
	int i,a;
	int dem=0;
	printf("Nhap vao mot so:");
	scanf("%d",&a);
	for(i=2;i<a;i++)
	{
		if(a%i==0)
	    dem=dem+1;
	}
	if(dem==0)
	printf("%d la so nguyen to",a);
	else
	printf("%d khong la so nguyen to",a);
	
}