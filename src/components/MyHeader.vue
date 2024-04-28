!
<template>
  <div>
    <input type="text" placeholder="请输入任务" @keyup.enter="submitTask($event)" ref="task"/>
  </div>
</template>

<script>

export default {
  name: "MyHeader",
  // props: ['submitTask'],
  methods: {
    submitTask(event) {
      // console.log(event)
      // //获取input的值
      // const val = event.target.value
      // console.log(val)
      // const addTask = {
      //   id: uuidv4(),
      //   name: val
      // }
      // console.log(addTask)
      this.$emit('submitTask', event);
    }
  }
}
</script>

<style>

</style>