---
title: "js继承"
date: 2022-05-28T23:39:07+08:00
draft: true
categories: ["js基础"]
tags: ["js继承"]
---





![img](/img/5d9c4450-72a3-11eb-85f6-6fac77c0c9b3.png)

## 什么是继承

继承（inheritance）是面向对象软件技术当中的一个概念。

如果一个类别B“继承自”另一个类别A，就把这个B称为“A的子类”，而把A称为“B的父类别”也可以称“A是B的超类”

- 继承的优点

继承可以使得子类具有父类别的各种属性和方法，而不需要再次编写相同的代码

在子类别继承父类别的同时，可以重新定义某些属性，并重写某些方法，即覆盖父类别的原有属性和方法，使其获得与父类别不同的功能

虽然`JavaScript`并不是真正的面向对象语言，但它天生的灵活性，使应用场景更加丰富

关于继承，我们举个形象的例子：

定义一个类（Class）叫汽车，汽车的属性包括颜色、轮胎、品牌、速度、排气量等

```js
class Car{
    constructor(color,speed){
        this.color = color
        this.speed = speed
        // ...
    }
}
```

由汽车这个类可以派生出“轿车”和“货车”两个类，在汽车的基础属性上，为轿车添加一个后备厢、给货车添加一个大货箱

```js
// 货车
class Truck extends Car{
    constructor(color,speed){
        super(color,speed)
        this.Container = true // 货箱
    }
}
```

这样轿车和货车就是不一样的，但是二者都属于汽车这个类，汽车、轿车继承了汽车的属性，而不需要再次在“轿车”中定义汽车已经有的属性

在“轿车”继承“汽车”的同时，也可以重新定义汽车的某些属性，并重写或覆盖某些属性和方法，使其获得与“汽车”这个父类不同的属性和方法

```js
class Truck extends Car{
    constructor(color,speed){
        super(color,speed)
        this.color = "black" //覆盖
        this.Container = true // 货箱
    }
}
```

从这个例子中就能详细说明汽车、轿车以及卡车之间的继承关系

## 实现方式

下面给出`JavaScripy`常见的继承方式：

- 原型链继承
- 构造函数继承（借助 call）
- 组合继承
- 原型式继承
- 寄生式继承
- 寄生组合式继承

### 原型链继承

原型链继承是比较常见的继承方式之一，其中涉及的构造函数、原型和实例，三者之间存在着一定的关系，即每一个构造函数都有一个原型对象，原型对象又包含一个指向构造函数的指针，而实例则包含一个原型对象的指针

举个例子

```js
 function Parent() {
    this.name = 'parent1';
    this.play = [1, 2, 3]
  }
  function Child() {
    this.type = 'child2';
  }
  Child1.prototype = new Parent();
  console.log(new Child())
```

上面代码看似没问题，实际存在潜在问题

```js
var s1 = new Child2();
var s2 = new Child2();
s1.play.push(4);
console.log(s1.play, s2.play); // [1,2,3,4]
```

改变`s1`的`play`属性，会发现`s2`也跟着发生变化了，这是因为两个实例使用的是同一个原型对象，内存空间是共享的

### 构造函数继承

借助 `call `调用`Parent`函数

```js
function Parent(){
    this.name = 'parent1';
}

Parent.prototype.getName = function () {
    return this.name;
}

function Child(){
    Parent1.call(this);
    this.type = 'child'
}

let child = new Child();
console.log(child);  // 没问题
console.log(child.getName());  // 会报错
```

可以看到，父类原型对象中一旦存在父类之前自己定义的方法，那么子类将无法继承这些方法

相比第一种原型链继承方式，父类的引用属性不会被共享，优化了第一种继承方式的弊端，但是只能继承父类的实例属性和方法，不能继承原型属性或者方法

### 组合继承

前面我们讲到两种继承方式，各有优缺点。组合继承则将前两种方式继承起来

```js
function Parent3 () {
    this.name = 'parent3';
    this.play = [1, 2, 3];
}

Parent3.prototype.getName = function () {
    return this.name;
}
function Child3() {
    // 第二次调用 Parent3()
    Parent3.call(this);
    this.type = 'child3';
}

// 注意：这里调用了Parent3构造函数，而且Child3.prototype.constructor也改变了。同时Child3实例和原型对象上都存在name属性
Child3.prototype = new Parent3();
// 手动挂上构造器，指向自己的构造函数
Child3.prototype.constructor = Child3;
var s3 = new Child3();
var s4 = new Child3();
s3.play.push(4);
console.log(s3.play, s4.play);  // 不互相影响
console.log(s3.getName()); // 正常输出'parent3'
console.log(s4.getName()); // 正常输出'parent3'
```

### 原型式继承

首先了解下一个方法Object.create。该方法创建一个新对象，使用现有的对象来提供新创建的对象的 __proto __。

缺点很明显：Object.create创建的实例对象只是一个浅拷贝

```js
let person = {
  name: "person",
  friends: ["p1", "p2", "p3"],
  getName: function () {
    return this.name;
  },
};

let person1 = Object.create(person);
person1.name = "tom";
person1.friends.push("jerry");

let person2 = Object.create(person);
person2.friends.push("lucy");

console.log(person1.name); // tom
console.log(person1.name === person1.getName()); // true
console.log(person2.name); // person
console.log(person1.friends); // ["p1", "p2", "p3","jerry","lucy"]
console.log(person2.friends); // ["p1", "p2", "p3","jerry","lucy"]
```

### 寄生式继承

寄生式继承在上面继承基础上进行优化，利用这个浅拷贝的能力再进行增强，添加一些方法

```js
let person = {
  name: "person",
  friends: ["p1", "p2", "p3"],
  getName: function () {
    return this.name;
  },
};

function clone(original) {
  let clone = Object.create(original);
  clone.getFriends = function () {
    return this.friends;
  };
  return clone;
}

let person5 = clone(person);

console.log(person5.getName()); // person
console.log(person5.getFriends()); // ["p1", "p2", "p3"]

```

### 寄生组合式继承

寄生组合式继承，借助解决普通对象的继承问题的` Object.create` 方法，在亲全面几种继承方式的优缺点基础上进行改造，这也是所有继承方式里面相对最优的继承方式

```js
function clone (parent, child) {
    // 这里改用 Object.create 就可以减少组合继承中多进行一次构造的过程
    child.prototype = Object.create(parent.prototype);
    child.prototype.constructor = child;
}

function Parent() {
    this.name = 'parent';
    this.play = [1, 2, 3];
}
Parent.prototype.getName = function () {
    return this.name;
}
function Child() {
    Parent.call(this);
    this.friends = 'child5';
}

clone(Parent, Child);

Child.prototype.getFriends = function () {
    return this.friends;
}

let person = new Child(); 
console.log(person); //{friends:"child5",name:"child5",play:[1,2,3],__proto__:Parent}
console.log(person.getName()); // parent
console.log(person.getFriends()); // child5
```



## 三、总结

![img](assets/0df74700-731c-11eb-ab90-d9ae814b240d.png)

通过`Object.create` 来划分不同的继承方式，最后的寄生式组合继承方式是通过组合继承改造之后的最优继承方式，而 `extends` 的语法糖和寄生组合继承的方式基本类似
