!
<template>
  <div>
    <input type="text" placeholder="请输入任务" @keyup.enter="submitTask($event)" ref="task"/>
  </div>
</template>

<script>

import {v4 as uuidv4} from "uuid";

export default {
  name: "MyHeader",
  // props: ['submitTask'],
  methods: {
    submitTask(event) {
      //获取input的值
      const val = event.target.value
      console.log(val)
      const addTask = {
        id: uuidv4(),
        name: val,
        flag: false
      }
      this.$bus.$emit('sendTask', addTask, event)
    }
  }
}
</script>

<style>

</style>