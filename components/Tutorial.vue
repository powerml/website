<template>
    <div>
        <div class="flex mb-4">
          <div class="w-full h-12"></div>
        </div>
        <!-- Three columns -->
        <div class="flex mb-4">
            <div class="w-1/3 h-12"></div>
            <div class="w-1/3 h-12">
                <div class="container mx-auto bg-teal-400 h-16">
                    <div class="max-w-sm rounded overflow-hidden ">
                        <div class="px-6 py-4">
                            <div class="font-bold text-4xl">Magically Simplify</div>
                            <div class="font-bold text-4xl mb-2">Your Data Models</div>
                            <p class="text-gray-700 text-base">
                                PowerML lets you effortlessly create data models, queries, and apps -- in one place.
                            </p>
                        </div>
                        <form class="w-full max-w-sm">
                          <div class="flex items-center border-b border-teal-500 py-2">
                            <input class="appearance-none bg-transparent border-none w-full
                                    text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none"
                                    type="text" placeholder="What's your email?" aria-label="Full name"
                                    v-model="email">
                          </div>
                        </form>
                        <div class="flex mb-4">
                        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-8 px-32 rounded"
                            @click="submit('some email')" v-if="notSubmitted">
                            See PowerML
                        </button>
                        <p class="text-gray-700 text-base" v-if="!notSubmitted">
                            Thank you!  We will contact you shortly.
                        </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="w-1/3 h-12"></div>
        </div>
    </div>

</template>

<script>
export default {
    name: 'NuxtTutorial',

    data(){
        return {
            email: "",
            notSubmitted: true
        }
    },

    methods: {
      async submit(){
          this.notSubmitted=false;
          const urlencoded = new URLSearchParams({
            "entry.1736061415": this.email
          });
          fetch( 'https://docs.google.com/forms/u/0/d/e/1FAIpQLSdDZ2H53dgHJJ9D9XzfmS5e-TgaDNyH0_lS83n76aVs4quvgQ/formResponse', {
              method: 'POST',
              mode: 'no-cors',
              body: urlencoded
          })
          .then((data) => {
              console.log("Got response: ", data);
          }).catch(console.log);
      }
    }
}
</script>
