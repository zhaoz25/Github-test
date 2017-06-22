#include <stdio.h>

main()
{
	int mang[50],i,in,tong;
	printf("nhap so phantu");
	scanf("%d",&in); //nhap so phan tu
	
	tong=0;
	for(i=0;i<in;i++)
	{
		printf("Nhap phan tu thu %d:",i+1);
		scanf("%d",&mang[i]); //nhap gia tri tung phan tu
	}
	for(i=0;i<in;i++)
	{
		tong=tong+mang[i]; //tinh tong
	}
	printf("trung binh cong: %f",(float)tong/in); //tinh tb cong
  
}