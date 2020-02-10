#include <stdio.h>

int main() {
	int a[5] = {1,20,3,4,5};
	int max_val;
	max_val = a[0];
	int i=1;
	for (i; i<5;i++) {
	if (a[i]>max_val) {
	max_val = a[i];	
}
}
	printf("max = %d", max_val);
	return max_val;
}