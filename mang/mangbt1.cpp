#include<stdio.h>
main()
{
	int a[5],i,max,min;
	//nhap du lieu
	for(i=0;i<5;i++)
	{
		printf("nhap vao so thu %d: ",i+1);
		scanf("%d",&a[i]);
	}
	//gan gia tri max, min
	max=a[0];
	min=a[0];
	//tim gia tri lon nhat
	for(i=0;i<5;i++)
	{
		if(a[i]>max)
		{
		   max=a[i];
		}
	}
	//tim gia tri nho nhat
	for(i=0;i<5;i++)
	{
		if(a[i]<min)
		{
		   min=a[i];
		}
	}
	//xuat du lieu
	printf("so lon nhat %d \n",max); 
	printf("so nho nhat %d",min);
}