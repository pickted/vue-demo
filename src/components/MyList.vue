<template>
  <div>
    <ul>
      <li v-for="item in dataList" :key="item.id">
        <input type="checkbox" :checked="item.flag" v-model="item.flag"
               @change="changeFlag(item.flag, `2`, item.id)"><span>{{ item.name }}</span>
        <button @click="deleteTask($event, item.id)">删除</button>
      </li>
      <li>
        <input type="checkbox" v-model="isAll" @change="checkAll($event)"><span>已完成:{{ doneNumber }} / </span><span> 全部:{{
          dataList.length
        }}</span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "MyList",
  props: ['dataList', 'deleteTask', 'changeFlag', 'flag'],
  data() {
    return {}
  },
  methods: {
    checkAll(e) {
      this.changeFlag(e.target.checked, "1")
    }
  },
  computed: {
    doneNumber() {
      let doneNumber = 0
      this.dataList.forEach(item => {
        if (item.flag) {
          doneNumber++
        }
      })
      return doneNumber
    },
    isAll:{
      get() {
        return this.dataList.length === this.doneNumber && this.doneNumber > 0
      },
      set(val) {
        this.changeFlag(val)
      }
    }
  }
}
</script>

<style>
li button {
  float: right;
  display: none;
}

li:hover {
  background: #ddd;
}

li:hover button {
  display: block;
}
</style>