#include <stdint.h>

// register address
#define RCC_BASE 0x40021000
#define GPIOC_BASE 0x40011000
#define RCC_APB2ENR *(volatile uint32_t *)(RCC_BASE + 0x18)
#define GPIOC_CRH *(volatile uint32_t *)(GPIOC_BASE + 0x04)
#define GPIOC_ODR *(volatile uint32_t *)(GPIOC_BASE + 0x0C)

// bit fields
#define RCC_IOPCEN (1<<4)
#define GPIOC13 (1UL<<13)


int main(void)
{

}
