<template>
  <div id="app">
    <!-- <img alt="Vue logo" src="./assets/logo.png"> -->
    <MyHeader @submitTask="submitTask"></MyHeader>
    <MyList :dataList="dataList" :deleteTask="deleteTask" :changeFlag="changeFlag" v-show="dataList.length"
            :clearTask="clearTask"></MyList>
  </div>
</template>

<script>

import MyHeader from './components/MyHeader.vue'
import MyList from './components/MyList.vue'
import {v4 as uuidv4} from "uuid";

export default {
  name: 'App',
  components: {
    MyHeader,
    MyList
  },
  data() {
    return {
      dataList: JSON.parse(localStorage.getItem('tasks')) || []
    }
  },
  methods: {
    submitTask(event) {
      //获取input的值
      const val = event.target.value
      const addTask = {
        id: uuidv4(),
        name: val,
        flag: false
      }
      this.dataList.unshift(addTask)
      event.target.value = null
    },
    deleteTask(event, id) {
      this.dataList = this.dataList.filter(item => item.id !== id)
      console.log("我是被删除后的数组长度", this.dataList.length)
    },
    changeFlag(flag, type, id) {
      if ("2" === type) {
        this.dataList.forEach(item => {
          if (item.id === id) {
            console.log("@@@", type, flag)
            item.flag = flag
          }
        })

      } else {
        this.dataList.forEach(item => {
          item.flag = flag
        })
      }
    },
    clearTask() {
      this.dataList = this.dataList.filter(item => {
        return item.flag === false
      })
    }
  },
  watch: {
    dataList: {
      //开启深度监视, 可以监视数组里面对象属性的改变, 不开启只能监视数组的改变
      deep: true,
      handler(value) {
        localStorage.setItem('tasks', JSON.stringify(value))
      }
    }
  }
}
</script>

<style>
#app {
  /* font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale; */
  text-align: center;
  /* color: #2c3e50;
  margin-top: 60px; */
}
</style>
