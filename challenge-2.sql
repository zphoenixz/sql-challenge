-- 1
select pr.model, pc.speed, pc.hd 
from pc
join product pr
on pc.model=pr.model
and pc.price < 500;

-- 2
select distinct pro.maker
from product pro
where type='Printer';

-- 3
select lap.model, lap.ram, lap.screen
from laptop lap
where lap.price > 1000;

-- 4
select *
from printer pri
where
pri.color='y'

-- 5
select pc.model, pc.speed, pc.hd
from pc
where
pc.price < 600 and
(
pc.cd='12x' or
pc.cd='24x'
)

-- 6
Select product.maker, laptop.speed
from product, laptop
where product.model=laptop.model and 
laptop.hd>=10
group by product.maker, laptop.speed

-- 7
select product.model, price from product, pc
where product.model = pc.model and maker = 'B'
union
select product.model, price from product, laptop
where product.model = laptop.model and maker = 'B'
union
select product.model, price from product, printer
where product.model = printer.model and maker = 'B'

-- 8
select maker from product
where type='PC'
except
select maker from product
where type='Laptop'

-- 9
select product.maker
from product 
join pc
on product.model=pc.model
where pc.speed>=450
group by product.maker

-- 10
select product.maker
from product 
join pc
on product.model=pc.model
where pc.speed>=450
group by product.maker

-- 11
select model, price
from printer
where price = (
	select max(price) 
	from Printer
)

-- 12
select avg(speed) as avg_speed from pc

-- 13
select AVG(pc.speed)
from product join pc 
on pc.model = product.model
where product.maker = 'A'

-- 14
select c.class, s.name, c.country
from classes c
join ships s
on s.class=c.class
and numGuns>=10

-- 15
select pc.hd
from pc
group by pc.hd
having count(hd) >= 2

-- 16
select a.model, b.model, a.speed, a.ram
from pc a
join pc b
on a.speed=b.speed and 
a.ram=b.ram 
where a.model>b.model
group by a.model, b.model, a.speed, a.ram

-- 17
select product.type, laptop.model, laptop.speed
from laptop
join product
on laptop.model=product.model
where laptop.speed < all (select speed 
 FROM PC
)
group by product.type, laptop.model, laptop.speed

-- 18
select p1.maker, p2.price
from product p1
join printer p2
on p1.model=p2.model and
color='y' and
p2.price = (
select min(price) 
 from printer
 where color='y'
)
group by p1.maker, p2.price

-- 19
select p.maker, avg(l.screen)
from product p
join laptop l
on p.model=l.model
group by p.maker

-- 20
select p.maker, count(p.model)
from product p
where type = 'pc'
group by p.maker
having count(p.model) >= 3

-- 21
select pr.maker, max(pc.price)
from product pr
join pc
on pr.model=pc.model
group by pr.maker

-- 22
select pc.speed, avg(price)
from pc
where pc.speed > 600
group by pc.speed

-- 23
select maker
from product
where maker in (
	select maker 
	from product pr
	join pc
	on pr.model = pc.model
	where pc.speed >= 750
        group by maker
)
and maker in (
	select distinct pr.maker 
	from product pr 
	join laptop l
	on pr.model = l.model
	where l.speed >= 750
        group by maker
)
group by maker

--24 NOT WORKING!!!!!
select model
from 
(
	select model, price from pc
	union 
	select model, price from laptop
	union 
	select model, price from printer
) as asd
where price = (
	select max(price) 
	from asd
)

--25 
select maker
from product join pc
on product.model = pc.model
where
maker in (
	select maker
	from product
	where type='printer'
)
and speed = (
	select max(speed)
	from pc
	where ram = (
		select min(ram)
		from pc)
	)
and ram = (
	select min(ram)
	from pc
)
group by maker
