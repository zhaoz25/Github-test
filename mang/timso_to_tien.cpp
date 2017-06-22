#include<stdio.h>
main()
{
	int a[5]={50,20,10,5,1};//khai bao, khoi tao mang voi 5 p,tu
	int sotien,i,soto;
	//nhap du lieu
	printf("Nhap vao so tien:");
	scanf("%d",&sotien);
	// xu ly
	for(i=0;i<5;i++)
	{
		soto=sotien/a[i]; //tim so to cua loai tien i
		printf("Co %d to %d \n",soto,a[i]); //in ra so to
		sotien=sotien%a[i]; //so tien con lai khi het vong 1
	}
}